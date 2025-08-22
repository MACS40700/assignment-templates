# Assignment 3 - Refining Visualization with [Plotly](https://plotly.com/r/)

This is the third assignment for MACS 40700. The task is to use Plotly to create visualizations, one focused on continuous data, and the other on categorical data. You will also reflect on the choices made during your design process, including comparisons with earlier draft and alternative versions.

> The aim of this assignment is to move beyond default plots by exploring different visual representations using Plotly, refining the design choices and justify your final selections through comparison and written explanation.

**Due Date:** February 3, 2026 by 11:59 pm CT\
**Full Assignment Instructions:** [Assignment 3](https://macs40700.netlify.app/assignments/assign3/)

---

## Project Setup Instructions

### Step 0: Clone This Repository
Open **RStudio** →  
Navigate to **File → New Project → From Version Control (Git)** →  
Paste the link to your GitHub Classroom repository →  
Select **“Open in new session”** →  
Open `plotly_refinement.Rmd`.

### Step 1: Read the full assignment instructions on the course [website](https://macs40700.netlify.app/assignments/assign3/) carefully. Then consult this `README` for a structured overview, step-by-step guidance, and submission checklist.

> If anything in the instructions is unclear, please consult the TA or Professor Clipperton during class or office hours.

### Step 2: Reference the Model Answer

A sample answer is provided in the `model_answer/` directory. This is intended solely for reference. **Do not copy from it**.

### Step 3: Work in `plotly_refinement.Rmd`

Edit this file to include:

- Your code
- Your written explanation (including reflections, justifications, and summary)
- All visual outputs required by the assignment

### Step 4: Knit to HTML (Visual Output)
Click the **Knit** button in RStudio to render your `.Rmd` file to `plotly_refinement.html`.  
This file serves as a full preview of your submission. Check that plots, labels, and structure are correctly rendered.

### Step 5: Preview and Revise
You will likely need to knit and revise multiple times to finalise formatting and resolve issues.

### Step 6: Generate `README.md`
When your `.Rmd` file is ready:
- Run `create_rendered_output.R` to produce a `README.md` version of your output.
- This will also generate the `README_files/` folder, which stores the embedded plots.

> `README.md` serves as the GitHub landing page. It must be complete, well-formatted, and should not be edited manually.

---

### Step 7: Stage, Commit, Push

Before committing, ensure that all required files and folder are included.

**Stage all files:**

* `plotly_refinement.Rmd`
* `plotly_refinement.html`
* `README.md`
* `README_files/` (plot outputs)
* `data/`
* Any additional files or folders used in your work

> Git does not track empty folders. Include at least one file in every folder you wish to retain.

Once staged:

* Write a clear and descriptive commit message (e.g., "Updated plots and added summary")
* Push all changes to GitHub using the Git pane or terminal in RStudio

---

### Step 8: Confirm Your Submission
- Visit your GitHub repository in a browser
- Confirm that `README.md` is correctly displayed
- Ensure all relevant content (text, code, plots) is present and functional
- Verify that no required files are missing

### Step 9: Submit on Canvas
Copy the URL of your GitHub repository and submit it via Canvas.

---

## Template File Structure

```
assignment-3-yourusername/
├── plotly_refinement.Rmd              # Primary file for your submission
├── plotly_refinement.html             # Output rendered from the Rmd file
├── README.md                          # Auto-generated landing page
├── README_files/                      # Folder with figures and plot images
├── create_rendered_output.R           # Script to render the markdown and HTML
├── data/                              # Folder for dataset(s)
├── model_answer/                      # Reference solution – for structure only
├── guidelines/                        # Archived copy of this README
├── assignment3.Rproj                  # RStudio project file
└── .gitignore                         # Prevents unintended files from being tracked
```

---

## Assignment Requirements Summary (*See the [assignment page](https://macs40700.netlify.app/assignments/assign3/) for full details*)

You are expected to submit a total of six plots—three related to continuous data and three to categorical data. Each group should include one rough draft, one alternative version, and one final version, along with written analysis.

> **NOTE 1**: Each plot should emphasize either a continuous or categorical variable on the y-axis. For the continuous plot, use a numeric variable as the main quantity being visualized (e.g., bar height, point position, box height). For the categorical plot, emphasize how values are distributed across groups or categories. Other variables may be used as aesthetics (e.g., color, shape, facets) or on the x-axis. Be sure to clearly indicate which plot fulfills which requirement.

> **NOTE 2**: Some visualizations may contain both categorical and continuous elements. What matters is the analytical emphasis of your plot—whether the focus is on comparing numeric distributions or categorical groupings. For example, a boxplot grouped by category could satisfy either the continuous or categorical requirement depending on whether your narrative centers on the numeric variable's distribution or the categorical differences.


Follow the steps below:

---

### 1. Choose and Describe Your Dataset

* Select a single dataset that will be used for both visualizations.
* Briefly describe the source, relevant variables, and what each variable represents.

> Ensure that your dataset includes at least two to three variables(categorical & continuous)that can be visualised in each plot.

---

### 2. Continuous Data Plot (3 plots)

* Start with a basic plot (rough draft).
* Create a final version with refined aesthetics and improved clarity.
* Add an alternative form you considered before selecting your final approach.
* Write a short reflection (approximately 250–300 words) addressing:
  * What each version communicates
  * Your rationale for the final design
  * How the visual clarity was improved

---

### 3. Categorical Data Plot (3 plots)

* Follow the same process:
  * One rough draft
  * One alternative
  * One final, refined version
* Write a similar reflection (approximately 250–300 words)

---

### 4. Final Narrative (500–750 words)

* Combine your previous reflections into a complete summary including:
  * A brief overview of your dataset
  * A justification of your visual choices
  * An explanation of how your designs developed over time

> The two visualizations should be related and part of a cohesive narrative.

---


## Checklist for Submission

* [ ] `plotly_refinement.Rmd` with all plots and written reflections
* [ ] Six total plots: three for continuous, three for categorical data
* [ ] Final summary narrative (\~500–750 words)
* [ ] `plotly_refinement.html` rendered output
* [ ] `README.md` auto-generated using `create_rendered_output.R`
* [ ] `README_files/` 
* [ ] `data/` folder
* [ ] All files committed and pushed with a clear commit message

> Verify that your GitHub repo displays the `README.md` correctly and contains all required components.

---


## Grading Criteria

Your submission will be evaluated according to the **Five Qualities of Great Visualizations**:

1. **Truthful** – Is the representation accurate?
2. **Functional** – Is it easy to read and interpret?
3. **Beautiful** – Is it clearly and purposefully designed?
4. **Insightful** – Does it reveal something that is not obvious?
5. **Enlightening** – Does it help us understand something more broadly?

### GitHub Repository Quality

* Clear and consistent directory structure
* Readable and structured `README.md`
* Effective use of markdown formatting
* All relevant files committed
* Rendered outputs display properly on GitHub

---

If you have questions, please check in early.