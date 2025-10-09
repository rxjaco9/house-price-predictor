🧩 1. git add .

This command stages all the changes (new, modified, or deleted files) in your working directory so that they’re ready to be committed.

. → means “add everything in this directory and its subfolders.”

Staging doesn’t save to Git history yet — it just marks what will be included in the next commit.

💡 Think of it as:

“Prepare these files for my next snapshot.”

📝 2. git commit -m "added model tranining"

This actually creates a new snapshot (commit) of your project in Git history.

-m gives the commit a message describing the change (in this case, “added model training”).

Git records:

The exact file changes (diff)

A unique commit ID (67399cc here)

Timestamp

Your name/email (from your Git config)

💡 Think of it as:

“Save this version of the project into Git with a description.”

☁️ 3. git push origin main

This uploads your new commit(s) to the remote repository on GitHub (origin = remote name, main = branch).