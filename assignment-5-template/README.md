# Assignment 2 - Portfolio Proposal & EDA

Welcome to Assignment 2 of MACS 40700! This template is designed to guide you through your portfolio-style assignment with clear steps and helpful structure.

> The goal of this assignment is to practice how to craft a clear narrative, choose appropriate plot types, and refine your design decisions.These skills are essential for effective and professional communication with data.

**Due Date:** January 23, 2026  
**Full Assignment Instructions:** [Assignment 2 - macs40700.netlify.app](https://macs40700.netlify.app/assignments/assign2/)

---

## Project Setup Instructions

### Step 0: Clone This Repository
Open **RStudio** ->  
Go to **File -> New Project -> From Version Control (Git)** ->  
Paste the link to your GitHub Classroom repo ->  
Select **“Open in new session”** ->  
Open `analysis.Rmd`.

### Step 1: Read This Entire Page Carefully
If anything is unclear, please consult with a TA or Professor Clipperton during class or office hours.

### Step 2: Reference the Model Answer
A model submission is provided in the `model_answer/` directory. **Do not copy it.** Use it only as a reference for formatting, structure, and tone.

### Step 3: Work in `analysis.Rmd`
Edit `analysis.Rmd` to include:
- Your code
- Your writeup (questions, goals, challenges, sketches, reflections)
- Three plots as described in the assignment instructions

### Step 4: Knit to HTML (Visual Output)
Click **Knit** in RStudio to render your `.Rmd` into `analysis.html`.  
Use this as your full preview. Please ensure that plots, text, and structure appear as intended.

### Step 5: Preview and Revise
You will likely need to **knit multiple times** to refine formatting and fix any errors.

### Step 6: Generate `README.md`
Once satisfied with your results:
- Run the file `create_rendered_output.R` to render `analysis.Rmd` to `README.md`  
- This script also generates the `README_files/` folder where your plots are stored

> `README.md` is what appears as the **landing page** of your GitHub repo.  
> It should be clean, readable, and complete. Do **not** edit it manually.


---

### Step 7: Stage, Commit, Push

Before committing, make sure you have included **all required files**:

**Stage all files:**

*  `analysis.Rmd`
*  `analysis.html`
*  `README.md`
*  `README_files/` (contains your plots)
*  `data/` (must contain at least one file)
*   Any additional outputs or supporting files or folders you have created

> Git does **not** track empty folders, therefore include at least one file per folder you want to keep

Once everything is staged:

* Write a clear, informative commit message (e.g., "Added exploratory plots and initial narrative")
* Push all changes to GitHub using the Git pane or terminal in Rstudio

---


### Step 8: Confirm Your Submission
- Go to your GitHub repo in a browser
- Check that the `README.md` displays properly
- Confirm all content (text, code, plots) is present and readable
- Ensure no essential file is missing

### Step 9: Submit on Canvas
Copy your GitHub repo URL and paste it into the Canvas submission box.

---

## Template File Structure

```
assignment-2-yourusername/
├── analysis.Rmd              # Your main working file: write everything here
├── analysis.html             # Output from knitting: full visual rendering
├── README.md                 # Auto-generated landing page from analysis.Rmd
├── README_files/             # Plots/images used by README.md
├── create_rendered_output.R  # Script to knit analysis.Rmd to README.md + HTML
├── data/                     # Place your dataset(s) here
├── model_answer/             # Reference only - DO NOT copy
├── assignment2.Rproj         # RStudio project file
└── .gitignore                # Prevents pushing junk files
```

---

## Assignment Requirements (Summary)

### Part 1: Portfolio Proposal
- Identify a **research question** (with a clear dependent and independent variable)
- Include:
  - Your dataset and source
  - Any data cleaning done
  - Three plot sketches (the first one should use real data)
  - Your full code
  - ~700 words on your vision and plot strategy
  - ~400 words on the two draft/sketch plots
  - ~200 words on the completed/refined plot
  - Anticipated challenges

### Part 2: EDA + Critique
- Submit your **first refined plot** (with title, axes, captions, etc.)
- Write ~200 words describing its design and the kind of feedback you want
- Write an additional ~500 word reflection on:
  - Your overall story and design choices
  - Why you chose these forms
  - Pros/cons of your visual decisions
  - Suggestions for improvement

---

## Grading Criteria

Your submission will be assessed based on the **Five Qualities of Great Visualizations**:

1. **Truthful** - Is the representation accurate and not misleading?
2. **Functional** - Does the chart help the viewer answer meaningful questions?
3. **Beautiful** - Is the design clean, accessible, and aesthetically pleasing?
4. **Insightful** - Does it help uncover something non-obvious?
5. **Enlightening** - Does it connect to a broader idea or implication?

### GitHub Repository Quality

* Clear, organized folder and file structure
* Well-formatted and readable `README.md`
* Markdown headers, paragraph spacing, and inline links are used effectively
* All necessary files are present and render correctly on GitHub
* Code and image files (if applicable) are committed properly
---

If in doubt, **ask questions early**. We are here to help and we want this to be clear, fair, and rewarding.

Good luck!
