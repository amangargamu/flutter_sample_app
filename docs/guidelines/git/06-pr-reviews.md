# PRs & Reviews

[Pull Requests | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/making-a-pull-request)

### **PR Checklist**

- Syntax & Formatting is correct (Linting should help with this)
- Is the approach to the problem appropriate?
- Can anything be simplified?
- Is the code too specific to the product and needs generalization?
- Any obvious security flaws or potential holes?
- Are the naming conventions appropriate?
- Are there enough comments inline with the code?
- Is there documentation needed?
- Is there anything included that should not be?
- Are the deprecated code removed?

### Raising a Pull Request

- Keep the PR changes limited to 10-15 files or less. **It is not a mandate, we understand that difficult times might
  require more file changes.**
- Add a proper message or title to PR which gives the overall understanding of changes included.
- Don’t forget to mention the task id or ticket number in the PR, if available.
- Ensure that code is in sync with latest changes on `main` branch or `target` branch.
- Don't take the feedbacks personally, the review is of the code and not you.
- Be grateful for the reviewer's suggestions. ("Good call. I'll make that change.")
- Try to respond to every comment or at least on the thread of an unresolved issue.
- Never approve the PR by yourself.

### Reviewing a Pull Request

Code reviews are the most integral part of any development process. Not only does it help us catch early bugs made by
the developers, but we also get to learn a lot in the process.

- Check if `source` and `target` branches are correctly specified.
- Understand the business logic that the developer is trying to implement.
- **It’s fine if you don’t understand the business matrix. You are reviewing for a better code, not for a better
  solution.**
- Look for logical flaws, edge cases and code quality in the code pushed and suggest the changes accordingly
- If you find the changes up to your satisfaction, resolve the thread yourself.
- If the changes are in more than 10-15 files, ask the developer to break down the PR into multiple smaller PRs.
- If needed, get on a call with the developer to resolve the issue or understand the logic behind the implementation.
- Approve the PR only if all the above criteria are matching.

### Leaving a comment

- Make comments on the code you think needs change and tag the developer.
- Ask, don’t tell. (“What do you think about trying…?” rather than “Don’t do…”).
- If you disagree strongly, consider giving it a few minutes before responding; think before you react.
- Explain your reasons why code should be changed. (Not in line with the style guide? A personal preference?) Offer ways
  to simplify or improve code.
- Avoid using derogatory terms, like “stupid”, when referring to the work someone has produced.
- Be humble. (“I’m not sure, let’s try…”).
- Avoid hyperbole. (“NEVER do…”).
- Aim to develop professional skills, group knowledge, and product quality, through group critique.
- Be aware of negative bias with online communication. (If the content is neutral, we assume the tone is negative.) Can
  you use positive language as opposed to neutral?.
- Use emoji to clarify tone. Compare “:sparkles: :sparkles: Looks good :+1: :sparkles: :sparkles:” to “Looks good.”

### Merging a Pull Request

- At least 1 approval should be required for a PR to get merged and it should not be from the developer himself/herself.
- Set branch permissions in order to ensure above restrictions.
- If possible, Integrate pipelines for basic sanity checks like successful compilation & build creation, Sonar analysis,
  all tests passing, etc and only after these checks pass, one should merge the PR.