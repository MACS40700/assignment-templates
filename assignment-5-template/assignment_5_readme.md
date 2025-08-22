# Assignment 5 - Interactive Visualization with [Shiny](https://shiny.posit.co/)

This is the fifth assignment for MACS 40700. The task is to develop an interactive visualization using Shiny to explore and communicate insights from a multi-variable dataset. You will design multiple coordinated plots and accompany them with written narrative to explain the decisions behind your design.

> The aim of this assignment is to extend your skills in purposeful design by introducing interactivity. You will connect multiple plots through a single interface, consider the narrative structure, and explain your design rationale.

**Due Date:** March 5, 2025 by 11:59 pm CT\
**Full Assignment Instructions:** [Assignment 5](https://macs40700.netlify.app/assignments/assign5/)

---

## Project Setup Instructions

### Step 0: Clone This Repository

Open **RStudio** →\
Navigate to **File → New Project → From Version Control (Git)** →\
Paste the link to your GitHub Classroom repository →\
Select **"Open in new session"** →\
Open the app file `shiny_gapminder_app.R`

### Step 1: Read the full assignment instructions on the course [website](https://macs40700.netlify.app/assignments/assign5/) carefully. Then consult this `README` for a structured overview, step-by-step guidance, and submission checklist.

> If anything in the instructions is unclear, please consult the TA or Professor Clipperton during class or office hours.

### Step 2: Reference the Model Answer

A sample answer is provided in the `model_answer/` directory. This is intended solely for reference. **Do not copy from it**.

### Step 3: Build Your Shiny App

Edit the Shiny app file to:

- Load and process data
- Include at least three plots, tied together by a narrative
- Implement tabs or a dashboard structure for organizing content
- Add clear titles, axes, labels, shiny themes etc.
- All visual outputs and explanations required by the assignment.


### Step 4: Run and Test Your App

Use the **Run App** button in RStudio to launch your Shiny app locally.

Ensure that:

- The application loads without error
- All inputs, plots, and outputs function correctly
- The layout and appearance are clear and accessible

### Step 5: Organize and Finalize the Repository

Include all scripts, data, and documentation required to run the app. Add a short `README.md` at the top level of your repository with a summary and link to the deployed app on [shinyapps.io](https://www.shinyapps.io/)

> Confirm that the link is working.

---

### Step 6: Stage, Commit, Push

Before committing, ensure that all required files are included.

**Stage all files:**

- `shiny_gapminder_app.R` (or equivalent)
- Supporting scripts (e.g., `helpers/`, `utils/` if applicable)
- `data/`
- `README.md` (containing the app summary and live link)


> Git does not track empty folders. Include at least one file in every folder you wish to retain.

Once staged:

- Write a clear and descriptive commit message (e.g., "Finalized app with three linked plots")
- Push all changes to GitHub using the Git pane or terminal in RStudio

---

### Step 7: Confirm Your Submission

- Visit your GitHub repository in a browser
- Confirm that all files are present and your `README` is clearly displayed
- Open your Shiny app and verify functionality
- Ensure all relevant content (text, code, plots) is present and functional
- Verify that no required files are missing

### Step 8: Submit on Canvas

Copy the URL of your GitHub repository, and submit via Canvas.

---

## Template File Structure

```
assignment-5-yourusername/
├── shiny_gapminder_app.R        # Main application file
├── data/                        # Folder containing gapminder and additional datasets
├── www/ or assets/              # External files: images, stylesheets, etc. 
├── model_answer/                # Reference solution – do not edit
├── guidelines/                  # Archived copy of this README
├── README.md                    # Short summary + link to deployed app
├── assignment5.Rproj            # RStudio project file
└── .gitignore                   # Prevents unintended files from being tracked
```

---

## Assignment Requirements Summary (*See the [assignment page](https://macs40700.netlify.app/assignments/assign5/) for full details*)

You are expected to build a functional Shiny application that includes at least three coordinated plots connected by a coherent narrative. You may use Gapminder data or another dataset of your choosing (with approval from Professor Clipperton).

Follow the steps below:

---

### 1. Choose and Prepare Your Dataset

- Use Gapminder or another dataset (must be approved by Professor Clipperton in advance)
- Select relevant indicators or variables
- Tidy and clean the dataset as needed

> The `import_gapminder()` function can be to download spreadsheets from Gapminder for full reproducibility.

---

### 2. Design the Shiny Application

- Create an interactive application using Shiny
- Structure your app with tabs or a dashboard layout
- Include at least **three distinct plots**, each with:
  - A different type of chart or visual approach
  - Appropriate interactivity (e.g., dropdowns, sliders)
  - A brief textual explanation or guiding commentary

---

### 3. Write a Short Narrative (\~500 words)

Include a written reflection (in your README or a separate file):

- What is the story being told ?
- Why did you choose these visual forms ?
- What role does interactivity play ?
- How do your choices support clear and effective communication ?


---

> **Note on Narrative and Written Explanation:**
> The written narrative can take the form of guiding commentary embedded directly within the Shiny app (e.g., text next to or above plots) or as a structured explanation included in the `.Rmd` file or markdown tabs. In addition to this embedded narrative, you must include an approximately 500-word design explanation defending your visual and interactive choices. This explanation can be placed in a dedicated tab or section of the app or included at the end of the rendered document. The goal is to ensure both your visualization and your rationale are clearly communicated and accessible to reviewers.


---

## Checklist for Submission

* [ ] `app.R` with a working Shiny app (includes 3 interactive plots)
* [ ] `README.md` with:

  * [ ] A short project summary
  * [ ] Link to app hosted on [shinyapps.io](https://www.shinyapps.io/)
* [ ] Use of varied chart types, interactivity, and [Shiny Themes](https://rstudio.github.io/shinythemes/)
* [ ] Navigation structure (tabs or dashboard)
* [ ] All files committed and pushed to GitHub

> Review your GitHub repo in the browser and the Shiny app to confirm everything is complete and renders properly.

---

## Grading Criteria

Your submission will be evaluated according to the **Five Qualities of Great Visualizations**:

1. **Truthful** – Is the representation accurate?
2. **Functional** – Is it easy to interpret and use?
3. **Beautiful** – Is the design purposeful and coherent?
4. **Insightful** – Does it offer something new or interesting?
5. **Enlightening** – Does it help connect data to a broader understanding?

### GitHub Repository Quality

- Logical file structure and naming conventions
- A readable and structured `README.md`
- All required files committed and rendering correctly
- App runs without errors and can be launched either locally or via a public link

---

If you have questions, please check in early.
