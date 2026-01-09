---
name: context7-search
description: Retrieve real-time technical documentation and code snippets from third-party libraries using the Context7 V2 API.
---

# Skill: Context7 Documentation Expert

This skill gives you access to the Context7 API to fetch up-to-date documentation, API references, and code examples. Use this to avoid hallucinations about library versions or API signatures.

## When to Use
1.  **Unknown Libraries**: When you need to use a library you are not familiar with.
2.  **Version Verification**: To check if a specific API exists in the latest version of a library (e.g., Next.js App Router vs Pages Router).
3.  **Debugging**: To find official solutions for error messages related to external dependencies.

## Workflow (Strict Two-Step Process)

### Step 1: Search for Library ID
**You MUST search first** to resolve the correct `libraryId` required by the API. Do not guess the ID.

* **Command:**
    `./scripts/context7_tool.sh search "<library_name>"`

* **Action:**
    - Parse the JSON response.
    - Locate the `id` field (e.g., `/vercel/next.js`, `/shadcn-ui/ui`).
    - Select the most relevant ID.

### Step 2: Retrieve Context
Use the `libraryId` found in Step 1 to fetch specific documentation.

* **Command:**
    `./scripts/context7_tool.sh context "<library_id>" "<specific_technical_question>"`

* **Example:**
    `./scripts/context7_tool.sh context "/vercel/next.js" "how to use server actions with form validation"`

## Output Guidelines
1.  **Synthesize, Don't Dump**: The tool returns raw JSON containing `code_snippets` and `content`. Do not output the raw JSON to the user.
2.  **Code First**: Prioritize extracting and adapting the code snippets to solve the user's problem.
3.  **Citation**: Explicitly mention that the solution is based on "Context7 documentation".

## Troubleshooting & Requirements
-   **Dependencies**: Requires `curl` and `jq` installed on the system.
-   **Proxy/SSL**: The script is pre-configured to handle local proxy SSL issues (`-k --proxy-insecure`).
-   **Errors**:
    -   If the search returns an empty list, ask the user to verify the library name.
    -   If you receive a "validation error", ensure you are using the correct `libraryId` from Step 1, not just the name.
