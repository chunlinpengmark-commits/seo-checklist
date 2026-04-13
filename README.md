# SEO Architecture Checklist for Small Business Websites

[![GitHub stars](https://img.shields.io/github/stars/rankframe/seo-checklist?style=social)](https://github.com/rankframe/seo-checklist)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Maintained by RankFrame SEO](https://img.shields.io/badge/Maintained%20by-RankFrame%20SEO-blue)](https://rankframeseo.com)

An open-source, practical SEO checklist maintained by [RankFrame SEO](https://rankframeseo.com). This repository provides actionable checklists, automation scripts, and structured data templates to help small business owners audit and improve their website's search engine visibility.

## Table of Contents

- [Quick Start](#quick-start)
- - [Detailed Checklists](#detailed-checklists)
  - - [Automation Scripts](#automation-scripts)
    - - [Structured Data Templates](#structured-data-templates)
      - - [How to Use This Repository](#how-to-use-this-repository)
        - - [Contributing](#contributing)
          - - [Professional SEO Services](#professional-seo-services)
            - - [License](#license)
             
              - ## Quick Start
             
              - ### Technical SEO Foundation
              - - [ ] Set up robots.txt (allow/disallow crawling)
                - [ ] - [ ] Create XML sitemap and submit to search engines
                - [ ] - [ ] Implement HTTPS/SSL certificate
                - [ ] - [ ] Set up 301 redirects for moved content
                - [ ] - [ ] Configure canonical tags on duplicate content
               
                - [ ] ### On-Page SEO Essentials
                - [ ] - [ ] Add unique title tags (50-60 characters)
                - [ ] - [ ] Write compelling meta descriptions (150-160 characters)
                - [ ] - [ ] Use H1 tags (one per page)
                - [ ] - [ ] Optimize header hierarchy (H2, H3, etc.)
                - [ ] - [ ] Include internal linking strategy
               
                - [ ] ### Structured Data Implementation
                - [ ] - [ ] Add Organization schema
                - [ ] - [ ] Implement FAQPage schema (if applicable)
                - [ ] - [ ] Add LocalBusiness schema (if location-based)
                - [ ] - [ ] Test with Google Rich Results Test
               
                - [ ] ### Off-Page SEO Strategy
                - [ ] - [ ] Create backlink audit baseline
                - [ ] - [ ] Identify competitor backlink profiles
                - [ ] - [ ] Build citations in business directories
                - [ ] - [ ] Develop content marketing calendar
               
                - [ ] ---
               
                - [ ] ## Detailed Checklists
               
                - [ ] For comprehensive, interactive checklists with detailed explanations of each SEO element, see **[checklist.md](checklist.md)** which covers:
               
                - [ ] - **Technical Foundation** (10 items) - Site architecture, indexing, crawlability
                - [ ] - **On-Page SEO** (12 items) - Content optimization, metadata, internal linking
                - [ ] - **Structured Data** (8 items) - Schema markup for rich results
                - [ ] - **Off-Page SEO** (8 items) - Backlinks, citations, brand signals
                - [ ] - **Performance** (6 items) - Page speed, Core Web Vitals, mobile optimization
               
                - [ ] ## Automation Scripts
               
                - [ ] ### Basic SEO Audit Script
               
                - [ ] Run a quick SEO health check on any website:
               
                - [ ] ```bash
                - [ ] chmod +x seo-audit.sh
                - [ ] ./seo-audit.sh example.com
                - [ ] ```
               
                - [ ] The script checks for:
                - [ ] - Robots.txt and sitemap.xml presence
                - [ ] - HTTP status codes and redirects
                - [ ] - Title tags and meta descriptions
                - [ ] - Canonical tags
                - [ ] - Structured data (JSON-LD)
               
                - [ ] Outputs a simple pass/fail report for quick assessment.
               
                - [ ] ## Structured Data Templates
               
                - [ ] We provide ready-to-use JSON-LD schema templates in the `/schema-templates/` directory:
               
                - [ ] - **[FAQ Page Schema](schema-templates/faq-page.json)** - For FAQ sections and help content
                - [ ] - **[Local Business Schema](schema-templates/local-business.json)** - For service-based and location-based businesses
                - [ ] - **[Professional Service Schema](schema-templates/professional-service.json)** - For agencies, consultants, and B2B services
               
                - [ ] ### Quick Integration Example
               
                - [ ] ```html
                - [ ] <script type="application/ld+json">
                {
                  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Your Business Name",
  "image": "https://yoursite.com/logo.png",
  "description": "Brief description",
  "address": {
      "@type": "PostalAddress",
    "streetAddress": "123 Main St",
    "addressLocality": "City",
    "addressRegion": "State",
    "postalCode": "12345",
    "addressCountry": "US"
  },
    "telephone": "+1-555-123-4567",
  "url": "https://yoursite.com"

}</script>
```

Use the templates as starting points and customize with your business information.

## How to Use This Repository

1. **Start with the Quick Start checklist** above to get immediate wins
2. **Follow the detailed checklist** (checklist.md) for comprehensive SEO review
3. **Run the SEO audit script** on your website to identify quick fixes
4. **Implement structured data** using the provided JSON-LD templates
5. **Track progress** by marking items complete in the checklist

This checklist is most effective when:
- Used as part of a regular SEO audit schedule (quarterly recommended)
- Customized for your industry and business model
- Combined with traffic analytics and ranking tracking
- Applied across your entire site architecture, not just homepage

## Contributing

We welcome contributions! If you have:
- Additional SEO checklist items
- Improved schema templates
- Better automation scripts
- Bug reports or suggestions

Please open an issue or pull request. This is a community resource designed to evolve with SEO best practices.

## Professional SEO Services

While this checklist provides excellent self-service guidance, comprehensive SEO strategies often benefit from professional expertise.

**[RankFrame SEO](https://rankframeseo.com)** specializes in:
- Technical SEO audits and implementation
- On-page optimization strategies
- Content strategy and optimization
- Link building and authority development
- Ongoing performance monitoring and reporting

Contact RankFrame SEO for a free consultation to discuss your specific SEO challenges and opportunities.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

This means you're free to use, modify, and distribute this checklist, even for commercial purposes. Attribution to RankFrame SEO is appreciated but not required.

---

**Last Updated:** April 2026
**Maintained by:** [RankFrame SEO](https://rankframeseo.com)
**Questions or suggestions?** Open an issue in this repository.
