# Assignment 1 - Visualization and Critique

This is the first assignment for MACS 40700. The task is to select a publicly available data visualization and write a critical evaluation of its design. Your analysis should consider both its strengths and weaknesses, with particular attention to the principles of effective data communication.

> The aim of this assignment is to develop your ability to critically assess visualizations using core principles such as clarity, accuracy, and narrative value.


**Due Date:** January 13, 2026 by 11:59 pm CT\
**Full Assignment Instructions:** [Assignment 1](https://macs40700.netlify.app/assignments/assign1/)

---

## Project Setup Instructions

### Step 0: Clone This Repository

Open **RStudio** →\
Navigate to **File → New Project → From Version Control (Git)** →\
Paste the link to your GitHub Classroom repository →\
Select **"Open in new session"** →\
Open `graph_critique.Rmd`.

### Step 1: Read the full assignment instructions on the course [website](https://macs40700.netlify.app/assignments/assign1/) carefully. Then consult this `README` for a structured overview, step-by-step guidance, and submission checklist.

> If anything in the instructions is unclear, please consult the TA or Professor Clipperton during class or office hours.

### Step 2: Reference the Model Answer

A sample answer is provided in the `model_answer/` directory. This is intended solely for reference. **Do not copy from it**.


### Step 3: Work in `graph_critique.Rmd`

Edit this file to include:

- Your selected chart and source
- Your full written critique

### Step 4: Knit to HTML (Visual Output)

Click the **Knit** button in RStudio to render your `.Rmd` file to `graph_critique.html`.\
This file serves as a full preview of your submission. Check that all text and formatting render as expected.

### Step 5: Preview and Revise

You will likely need to knit and revise multiple times to finalise formatting and resolve issues.

### Step 6: Generate `README.md`

When your `.Rmd` file is ready:

- Run `create_rendered_output.R` to produce a `README.md` version of your output
- This will also generate the `README_files/` folder, which stores any embedded images or graphics

> `README.md` serves as the GitHub landing page. It must be complete, well-formatted, and should not be edited manually.

---

### Step 7: Stage, Commit, Push

Before committing, ensure that all required files are included.

**Stage all files:**

- `graph_critique.Rmd`
- `graph_critique.html`
- `README.md`
- `README_files/`
- `data/`
- Any additional files or folders referenced in your writeup

> Git does not track empty folders. Include at least one file in every folder you wish to retain.

Once staged:

- Write a clear and descriptive commit message (e.g., "Added critique draft and formatted output")
- Push all changes to GitHub using the Git pane or terminal in RStudio

---

### Step 8: Confirm Your Submission

- Visit your GitHub repository in a browser
- Confirm that `README.md` is correctly displayed
- Ensure all relevant content (text and embedded visuals, if any) is present and functional
- Verify that no required files are missing

### Step 9: Submit on Canvas

Copy the URL of your GitHub repository and submit it via Canvas.

---

## Template File Structure

```
assignment-1-yourusername/
├── graph_critique.Rmd        # Primary file for your submission
├── graph_critique.html       # Output rendered from the Rmd file
├── README.md                 # Auto-generated landing page
├── README_files/             # Folder with any image outputs
├── create_rendered_output.R  # Script to render the markdown and HTML
├── data/                     # Folder for any supporting data files (if applicable)
├── model_answer/             # Reference solution – do not edit
├── assignment1.Rproj         # RStudio project file
└── .gitignore                # Prevents unintended files from being tracked
```

---

## Assignment Requirements Summary (*See the [assignment page](https://macs40700.netlify.app/assignments/assign1/) for full details*)

- Choose a **data visualization** from one of the recommended sources or any other credible source.

- Write a **critique of approximately 1000 words** that addresses the following five design principles:

  1. **Truthful** – Is the chart accurate and not misleading?
  2. **Functional** – Is it readable, usable, and understandable?
  3. **Beautiful** – Is it visually coherent and well-designed?
  4. **Insightful** – Does it show something non-obvious or worth noticing?
  5. **Enlightening** – Does it help connect to a broader question or understanding?

- Your critique should:

  - Address both strengths and weaknesses
  - Include a brief **improvement paragraph** at the end suggesting concrete ways the visualization could be revised or enhanced
  - Clearly cite the **source** of the visualization (e.g., blog, news site, journal, academic paper)

---


## Checklist for Submission

* [ ] `graph_critique.Rmd` with your full critique and source link
* [ ] \~1000 word analysis using the five visualization qualities
* [ ] Paragraph suggesting specific improvements
* [ ] `graph_critique.html` rendered output
* [ ] `README.md` auto-generated
* [ ] All files committed and pushed with a clear commit message



> Verify that your GitHub repo displays the `README.md` correctly and contains all required components.

---

## Grading Criteria

Your submission will be evaluated according to the following:

### Visualization Critique

- Do you thoughtfully address all five design qualities?
- Is your critique balanced and well-reasoned?
- Is your improvement suggestion clear and feasible?
- Have you cited the visualization source and included a complete writeup?

### GitHub Repository Quality

- Logical file structure and naming conventions
- A readable and structured `README.md`
- All required files committed and rendering correctly
- Clear formatting and organization in both `.Rmd` and rendered outputs

---

If you have questions, please check in early.

