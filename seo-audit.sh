#!/bin/bash

#####################################################################
# SEO Audit Script - Quick Website SEO Health Check
#
# Usage: ./seo-audit.sh example.com
#
# This script performs a quick audit of essential SEO elements:
# - robots.txt and sitemap.xml presence
# - HTTP status codes and redirect chains
# - Title tags and meta descriptions
# - Canonical tags
# - Structured data (JSON-LD)
#
# Output: Simple pass/fail report
#####################################################################

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Initialize counters
PASS_COUNT=0
FAIL_COUNT=0
WARN_COUNT=0

# Function to print results
print_result() {
    local test=$1
        local status=$2

            if [ "$status" = "PASS" ]; then
                    echo -e "${GREEN}[PASS]${NC} $test"
                            ((PASS_COUNT++))
                                elif [ "$status" = "FAIL" ]; then
                                        echo -e "${RED}[FAIL]${NC} $test"
                                                ((FAIL_COUNT++))
                                                    elif [ "$status" = "WARN" ]; then
                                                            echo -e "${YELLOW}[WARN]${NC} $test"
                                                                    ((WARN_COUNT++))
                                                                        fi
                                                                        }

                                                                        print_section() {
                                                                            echo -e "\n${BLUE}=== $1 ===${NC}"
                                                                            }

                                                                            # Validate input
                                                                            if [ -z "$1" ]; then
                                                                                echo "Usage: $0 domain.com"
                                                                                    echo "Example: $0 example.com"
                                                                                        exit 1
                                                                                        fi

                                                                                        DOMAIN=$1
                                                                                        DOMAIN=$(echo "$DOMAIN" | sed 's|https://||' | sed 's|http://||' | sed 's|/$||')
                                                                                        URL="https://$DOMAIN"

                                                                                        echo -e "${BLUE}========================================${NC}"
                                                                                        echo -e "${BLUE}SEO HEALTH CHECK - $DOMAIN${NC}"
                                                                                        echo -e "${BLUE}========================================${NC}"

                                                                                        # Check if domain is reachable
                                                                                        echo -e "\n${BLUE}Checking domain connectivity...${NC}"
                                                                                        if ! curl -s -m 5 -I "$URL" > /dev/null 2>&1; then
                                                                                            URL="http://$DOMAIN"
                                                                                                if ! curl -s -m 5 -I "$URL" > /dev/null 2>&1; then
                                                                                                        echo -e "${RED}ERROR: Cannot reach $DOMAIN.${NC}"
                                                                                                                exit 1
                                                                                                                    fi
                                                                                                                    fi
                                                                                                                    echo -e "${GREEN}Domain is reachable${NC}"
                                                                                                                    
                                                                                                                    print_section "TECHNICAL FOUNDATION"
                                                                                                                    
                                                                                                                    # Check robots.txt
                                                                                                                    ROBOTS_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL/robots.txt")
                                                                                                                    if [ "$ROBOTS_STATUS" = "200" ]; then
                                                                                                                        print_result "robots.txt exists" "PASS"
                                                                                                                        else
                                                                                                                            print_result "robots.txt missing (HTTP $ROBOTS_STATUS)" "FAIL"
                                                                                                                            fi
                                                                                                                            
                                                                                                                            # Check sitemap.xml
                                                                                                                            SITEMAP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL/sitemap.xml")
                                                                                                                            if [ "$SITEMAP_STATUS" = "200" ]; then
                                                                                                                                print_result "sitemap.xml exists" "PASS"
                                                                                                                                else
                                                                                                                                    print_result "sitemap.xml missing (HTTP $SITEMAP_STATUS)" "FAIL"
                                                                                                                                    fi
                                                                                                                                    
                                                                                                                                    # Check HTTP status
                                                                                                                                    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
                                                                                                                                    if [ "$HTTP_STATUS" = "200" ]; then
                                                                                                                                        print_result "Homepage returns 200 OK" "PASS"
                                                                                                                                        else
                                                                                                                                            print_result "Homepage returns HTTP $HTTP_STATUS" "WARN"
                                                                                                                                            fi
                                                                                                                                            
                                                                                                                                            # Check HTTPS
                                                                                                                                            if [[ "$URL" == "https://"* ]]; then
                                                                                                                                                print_result "HTTPS/SSL is enabled" "PASS"
                                                                                                                                                else
                                                                                                                                                    print_result "HTTPS/SSL is not enabled" "FAIL"
                                                                                                                                                    fi
                                                                                                                                                    
                                                                                                                                                    print_section "ON-PAGE SEO"
                                                                                                                                                    
                                                                                                                                                    HTML=$(curl -s "$URL")
                                                                                                                                                    
                                                                                                                                                    # Check title tag
                                                                                                                                                    TITLE=$(echo "$HTML" | grep -oP '(?<=<title>)[^<]+' | head -1)
                                                                                                                                                    if [ -n "$TITLE" ]; then
                                                                                                                                                        TITLE_LENGTH=${#TITLE}
                                                                                                                                                            if [ "$TITLE_LENGTH" -ge 30 ] && [ "$TITLE_LENGTH" -le 60 ]; then
                                                                                                                                                                    print_result "Title tag ($TITLE_LENGTH chars)" "PASS"
                                                                                                                                                                        else
                                                                                                                                                                                print_result "Title tag length suboptimal ($TITLE_LENGTH chars)" "WARN"
                                                                                                                                                                                    fi
                                                                                                                                                                                    else
                                                                                                                                                                                        print_result "Title tag missing" "FAIL"
                                                                                                                                                                                        fi
                                                                                                                                                                                        
                                                                                                                                                                                        # Check meta description
                                                                                                                                                                                        META_DESC=$(echo "$HTML" | grep -oP '(?<=<meta name="description" content=")[^"]+' | head -1)
                                                                                                                                                                                        if [ -n "$META_DESC" ]; then
                                                                                                                                                                                            print_result "Meta description present" "PASS"
                                                                                                                                                                                            else
                                                                                                                                                                                                print_result "Meta description missing" "FAIL"
                                                                                                                                                                                                fi
                                                                                                                                                                                                
                                                                                                                                                                                                # Check canonical
                                                                                                                                                                                                CANONICAL=$(echo "$HTML" | grep -oP '(?<=<link rel="canonical" href=")[^"]+' | head -1)
                                                                                                                                                                                                if [ -n "$CANONICAL" ]; then
                                                                                                                                                                                                    print_result "Canonical tag present" "PASS"
                                                                                                                                                                                                    else
                                                                                                                                                                                                        print_result "Canonical tag missing" "WARN"
                                                                                                                                                                                                        fi
                                                                                                                                                                                                        
                                                                                                                                                                                                        # Check H1
                                                                                                                                                                                                        H1_COUNT=$(echo "$HTML" | grep -o "<h1" | wc -l)
                                                                                                                                                                                                        if [ "$H1_COUNT" = "1" ]; then
                                                                                                                                                                                                            print_result "One H1 tag found" "PASS"
                                                                                                                                                                                                            elif [ "$H1_COUNT" -gt 1 ]; then
                                                                                                                                                                                                                print_result "Multiple H1 tags ($H1_COUNT)" "FAIL"
                                                                                                                                                                                                                else
                                                                                                                                                                                                                    print_result "No H1 tag found" "FAIL"
                                                                                                                                                                                                                    fi
                                                                                                                                                                                                                    
                                                                                                                                                                                                                    print_section "STRUCTURED DATA"
                                                                                                                                                                                                                    
                                                                                                                                                                                                                    SCHEMA_COUNT=$(echo "$HTML" | grep -o 'type="application/ld+json"' | wc -l)
                                                                                                                                                                                                                    if [ "$SCHEMA_COUNT" -gt 0 ]; then
                                                                                                                                                                                                                        print_result "JSON-LD structured data found ($SCHEMA_COUNT blocks)" "PASS"
                                                                                                                                                                                                                        else
                                                                                                                                                                                                                            print_result "No JSON-LD structured data found" "WARN"
                                                                                                                                                                                                                            fi
                                                                                                                                                                                                                            
                                                                                                                                                                                                                            # Summary
                                                                                                                                                                                                                            TOTAL=$((PASS_COUNT + FAIL_COUNT + WARN_COUNT))
                                                                                                                                                                                                                            PASS_PERCENT=$((PASS_COUNT * 100 / TOTAL))
                                                                                                                                                                                                                            
                                                                                                                                                                                                                            echo -e "\n${BLUE}========================================${NC}"
                                                                                                                                                                                                                            echo -e "${BLUE}AUDIT SUMMARY${NC}"
                                                                                                                                                                                                                            echo -e "${BLUE}========================================${NC}"
                                                                                                                                                                                                                            echo -e "${GREEN}[PASS]${NC} $PASS_COUNT   ${YELLOW}[WARN]${NC} $WARN_COUNT   ${RED}[FAIL]${NC} $FAIL_COUNT"
                                                                                                                                                                                                                            echo -e "Score: $PASS_PERCENT%"
                                                                                                                                                                                                                            echo -e "\nDetailed audit: https://rankframeseo.com"
                                                                                                                                                                                                                            echo -e "${BLUE}========================================${NC}\n"
                                                                                                                                                                                                                            
                                                                                                                                                                                                                            exit 0
