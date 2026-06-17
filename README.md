# Technical Writing KB

A modern, open-source knowledge base for technical writers learning the Docs as Code methodology.

![Zensical Version](https://img.shields.io/badge/SSG-Zensical-blue)
![License](https://img.shields.io/badge/License-MIT-green)

This project is a curated repository of technical writing standards, industry best practices, and infrastructure guides. It is built by a technical writer for technical writers—specifically those moving from traditional documentation tools to modern, developer-centric workflows.

[View the Live Site →](https://vaishvanara.github.io/techwritingkb/)

---

## Project mission

The goal of this knowledge base is to bridge the gap between technical writing and engineering. It follows a learning-in-public model, documenting the transition from foundational writing mechanics to complex documentation infrastructure (API specs, CI/CD pipelines, and automated linting).

---

## What's inside

The content is organized into four strategic pillars:

- **Technical writing:** Foundational craft, including the 7 Cs, Plain Language, and UX writing.
- **Documentation stack:** The "technical" in technical writing (Git, SSGs, OpenAPI, and Markdown).
- **Documentation lifecycle:** The professional workflow (SDLC integration, SME interviews, and maintenance).
- **Reference materials:** Quick-lookup templates, glossaries, and industry standards (ISO/DITA).

---

## Tech stack

This site is a living example of **Docs as Code**:

- **Static Site Generator:** [Zensical](https://zensical.com)
- **Formatting:** Extended Markdown (Admonitions, Mermaid.js, MathJax)
- **Deployment:** GitHub Pages
- **Automation:** GitHub Actions for automated builds and link checking.

---

## Local development

To run this knowledge base on your local machine:

### Prerequisites

- **Python 3.11+** installed on your system.
- A terminal or command prompt.

### Installation

Zensical is a Python package. We recommend installing it within a virtual environment to keep your dependencies isolated.

macOS / Linux

```bash
# Create a virtual environment
python3 -m venv .venv

# Activate the environment
source .venv/bin/activate
    
# Install Zensical
pip install zensical
```

Windows

```bash
# Create a virtual environment
python -m venv .venv

# Activate the environment
.venv\Scripts\activate

# Install Zensical
pip install zensical
```

### Serving the site

Once installed, use the built-in preview server to view your changes in real-time:

```bash
zensical serve
```
The site will be available at `http://localhost:8000`.

---

## Contributing

As this is a community-focused resource, contributions are welcome! 

1. **Report a Bug:** Open an issue if you find broken links or outdated info.
2. **Request a Topic:** If there's a gap in the KB, let me know.
3. **Submit a PR:** See `CONTRIBUTING.md` (coming soon) for style guidelines and pull request templates.

---

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT). Feel free to fork it and use it as a template for your own documentation projects.

---

**Maintained by [@vaishvanara](https://github.com/vaishvanara)**  
*Learning in public and building for the community.*