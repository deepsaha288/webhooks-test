# detect_changed_projects.py
import subprocess

def get_changed_files():
    # Get list of changed files between last and current commit
    result = subprocess.run(["git", "diff", "--name-only", "HEAD~1", "HEAD"],
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return result.stdout.strip().split("\n")

def extract_changed_projects(files):
    projects = set()
    for f in files:
        parts = f.split('/')
        if len(parts) > 1:
            projects.add(parts[0])  # top-level project folder
    return sorted(projects)

if __name__ == "__main__":
    changed_files = get_changed_files()
    changed_projects = extract_changed_projects(changed_files)
    if changed_projects:
        print("Changed projects:")
        for proj in changed_projects:
            print(proj)
    else:
        print("No project-level changes detected.")