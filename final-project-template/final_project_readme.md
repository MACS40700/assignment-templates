# Final Project

This is the final project for MACS 40700. It represents an opportunity to apply principles of visual design and your technical skills to a topic of personal or academic interest. You may work individually or in teams of up to three.

> The aim of this project is to pose a meaningful question, explore it through data, and present your findings using carefully designed and well-justified visualizations.

**Due Date:** March 12, 2026 by 11:59 pm CT\
**Full Instructions:** [Final Project](https://macs40700.netlify.app/assignments/final-project/)

---

## Project Setup Instructions

### Step 0: Clone This Repository

Open **RStudio** →\
Navigate to **File → New Project → From Version Control (Git)** →\
Paste the link to your GitHub Classroom repository →\
Select **"Open in new session"** →\
Open your primary project file (e.g., `final_project.Rmd` or `app.R`).

### Step 1: Read the full assignment instructions on the course [website](https://macs40700.netlify.app/assignments/final-project/) carefully. Then consult this `README` for a structured overview, step-by-step guidance, and submission checklist.

> If anything in the instructions is unclear, please consult the TA or Professor Clipperton during class or office hours.

### Step 2: Identify a Clear Research Question

Choose a topic or question that is relevant for you. It should allow you to investigate patterns, relationships, or change over time using data and visual representation.

### Step 3: Select a Project Format

Your project must include at least one interactive or dynamic component. Possible formats include:

- A static report (PDF/HTML) with embedded graphics
- An interactive Shiny app or R Markdown dashboard
- A public-facing website using R Markdown or Quarto
- A Tableau Public visualization

> You may use any tools appropriate for your topic, but reproducibility and documentation are required.

### Step 4: Develop Your Visualization

Use skills from the course to:

- Explore and clean your data
- Create effective static and interactive visualizations
- Refine your design using course principles
- Connect your findings to a broader narrative

### Step 5: Organize and Finalize the Repository

Include all scripts, data, and documentation. Add a short `README.md` at the top level of your repository with a summary and link to the deployed app(if applicable)

> Confirm that the link is working.

---

### Step 6: Stage, Commit, Push

Before committing, ensure that all required files are included.

**Stage all files:**

- Project file(s): `final_project.Rmd`, `app.R`, etc.
- Output file(s): `.html`, `.pdf`, or hosted link (linked in `README.md`)
- `README.md`
- `data/`
- `paper/` (if applicable)
- `www/` or `output/` folder (for hosted assets)
- Any supporting code, scripts, or folders used

> Git does not track empty folders. Include at least one file per directory to retain it in the repo.

Once staged:

* Write a clear commit message (e.g., “Final version with paper and hosted link”)
* Push changes to GitHub via Git pane or terminal in RStudio


---

### Step 7: Confirm Your Submission

- Visit your GitHub repository in a browser
- Confirm that all files are present and your `README` is clearly displayed
- Ensure all relevant content (text, code, plots) is present and functional
- Verify that no required files are missing

### Step 8: Submit on Canvas

Copy the URL of your GitHub repository, and submit via Canvas.


---

## Final Deliverables

All materials should be committed to your GitHub repository. Your final deliverables include:

### 1. Visualization Output

Your final visualizations may be hosted online (e.g., Shiny, Quarto site) or included in your GitHub repository (e.g., `.html`, `.pdf`).

- If hosted externally, include a link in your`README.md` file.
- At least one interactive plot is required.

### 2. Paper (4–6 pages)

You must include a written explanation of your design process and key insights. Depending on your project format:

- If your final product is a **research paper**, that document already satisfies this requirement. It should include:
  - **Introduction** – Your research question and motivation
  - **Methods** – Visualization approach and design decisions
  - **Results/Discussion** – Key takeaways and alignment with design principles

- If your final product is a **Shiny app, dashboard, or interactive site**, include a **4–6 page written report**, either as a separate PDF/HTML document or embedded within your site. This report should contain the same core sections listed above and complement your visualization by providing the narrative and rationale behind your work.

### 3. `README.md`

Your landing page should include:

- A brief project description and summary of findings
- Setup instructions to run your code locally (e.g., packages to install, how to access or download data)
- A link to the hosted visualization (if applicable)
- Division of responsibilities if you worked in a team

### 4. Code

Include all source code needed to reproduce your results. Code should be:

- Well-commented and organized
- Clearly structured into files/folders if the project has multiple components
- Cleaned of unused or test code before submission

> Review your GitHub repo in the browser, Shiny app or website to confirm everything is complete and renders properly.
---

## File Structure Template

```
final-project-yourusername/
├── final_project.Rmd or app.R         # Primary file for analysis or visualization
├── final_project.html/pdf             # Rendered version (if applicable)
├── README.md                          # Project overview and usage instructions
├── data/                              # Folder for any supporting data files
├── paper/                             # PDF or HTML write-up if not embedded
├── www/ or output/                    # Plots or interactive assets (if needed)
├── project.Rproj                      # RStudio project file
└── .gitignore                         # Prevents tracking of irrelevant files
```

---

## Grading Criteria

Projects will be evaluated based on:

### Visualization Quality

1. **Truthful** – Is the representation accurate and fair?
2. **Functional** – Is it usable and interpretable?
3. **Beautiful** – Is it polished and coherent in design?
4. **Insightful** – Does it highlight important patterns or ideas?
5. **Enlightening** – Does it provide broader understanding or engagement?

### Project Scope and Clarity

- Does the project address a meaningful question?
- Is the narrative clear and well-supported by visuals?
- Is at least one interactive/dynamic element included?

### Code and Repository Quality

- File structure is logical and complete
- Code is well-documented and reproducible
- Instructions are sufficient for others to run the project
- `README.md` is complete and well-formatted


---

If you have questions, please check in early.

