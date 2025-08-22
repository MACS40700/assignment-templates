# Assignment 3 - Refining Visualization with [Ploty](https://plotly.com/r/)

Welcome to Assignment 3 of MACS 40700. In this assignment, you'll use Plotly to create two well-designed visualizations — one focused on continuous data, the other on categorical — and explain the decisions behind your design choices.

> The goal of this assignment is to move beyond default plots and practice purposeful, iterative design. You'll explore multiple visualization options and justify your final selections through clear narrative and comparison.

**Due Date:** February 3, 2026  
**Full Assignment Instructions:** [Assignment 3 - macs40700.netlify.app](https://macs40700.netlify.app/assignments/assign3/)

---

## Project Setup Instructions

### Step 0: Clone This Repository
Open **RStudio** ->  
Go to **File -> New Project -> From Version Control (Git)** ->  
Paste the link to your GitHub Classroom repo ->  
Select **“Open in new session”** ->  
Open `plotly_refinement.Rmd`.

### Step 1: Read This Entire Page Carefully
If anything is unclear, please consult with a TA or Professor Clipperton during class or office hours.

### Step 2: Reference the Model Answer
A model submission is provided in the `model_answer/` directory. **Do not copy it.** Use it only as a reference for formatting, structure, and tone.

### Step 3: Work in `plotly_refinement.Rmd`
Edit `plotly_refinement.Rmd` to include:
- Your code
- Your writeup (questions, goals, challenges, sketches, reflections)
- Three plots as described in the assignment instructions

### Step 4: Knit to HTML (Visual Output)
Click **Knit** in RStudio to render your `.Rmd` into `plotly_refinement.html`.  
Use this as your full preview. Please ensure that plots, text, and structure appear as intended.

### Step 5: Preview and Revise
You will likely need to **knit multiple times** to refine formatting and fix any errors.

### Step 6: Generate `README.md`
Once satisfied with your results:
- Run the file `create_rendered_output.R` to render `plotly_refinement.Rmd` to `README.md`  
- This script also generates the `README_files/` folder where your plots are stored

> `README.md` is what appears as the **landing page** of your GitHub repo.  
> It should be clean, readable, and complete. Do **not** edit it manually.


---

### Step 7: Stage, Commit, Push

Before committing, make sure you have included **all required files**:

**Stage all files:**

*  `plotly_refinement.Rmd`
*  `plotly_refinement.html`
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
assignment-3-yourusername/
├── plotly_refinement.Rmd              # Your main working file: write everything here
├── plotly_refinement.html             # Output from knitting: full visual rendering
├── README.md                 # Auto-generated landing page from plotly_refinement.Rmd
├── README_files/             # Plots/images used by README.md
├── create_rendered_output.R  # Script to knit plotly_refinement.Rmd to README.md + HTML
├── data/                     # Place your dataset(s) here
├── model_answer/             # Reference only - DO NOT copy
├── guidelines/               # Reference copy of original README.md with instructions
├── assignment2.Rproj         # RStudio project file
└── .gitignore                # Prevents pushing junk files
```

---

## Assignment Requirements Summary [*check the [assignment](https://macs40700.netlify.app/assignments/assign3/) page for full details*]

You will submit **six plots total** — three for continuous data and three for categorical data — along with a short narrative that explains your choices.

Follow this sequence:

---

### 1. Choose and Describe Your Dataset

* Select a single dataset to use for both visualizations.
* Describe the dataset briefly: source, variables of interest, and what each variable represents.

>Make sure the dataset allows you to include at least **2–3 variables per plot**. 

---

### 2. Create and Evaluate Your Continuous Data Plot (3 plots)

* Start with a **rough draft**: a basic plot without customizations.
* Improve upon the initial draft to create a **final, customized version**, with clear labeling and aesthetic improvements.
* Additionally submit an **alternative draft**: a different chart type you considered before you committed to the final version.
* Write a short reflection (\~250–300 words) explaining:

  * What each version shows
  * Why you chose the final form
  * What design customizations improved clarity

---

### 3. Create and Evaluate Your Categorical Data Plot (3 plots)

* Repeat the same process:

  * One rough draft
  * One alternative form
  * One final, polished version
* Write a second short reflection (\~250–300 words) covering the same points as above.

---

### 4. Final Narrative (500–750 words total)

* Combine your reflections into a **single write-up** that includes:

  * A brief description of your dataset
  * Explanation and justification for both plots
  * How your design evolved and why your final plots work best

>Both plots should be connected into a cohesive narrative — the text and visuals should work together to tell a unified story.
---

### Checklist for What to Include

* [ ] Your `.Rmd` file: `visual_draft_review.Rmd`
* [ ] Six total plots: three for each data type
* [ ] A clear final narrative (inside your `.Rmd`)
* [ ] Source and description of your dataset
* [ ] Code for all visualizations
* [ ] Final output files rendered and pushed to GitHub


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
