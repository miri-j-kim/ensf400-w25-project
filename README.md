# ensf400-project-group22

## Running the Application
   ```bash
docker pull maziliu/demo-app:latest
docker run -p 8080:8080 maziliu/demo-app:latest
```

## Git Workflow

### Branching Strategy
- `main`: Production-ready branch. No direct commits should occur in this branch.
- `feature-*`: Feature branches. Used for bug fixes/new functionalities.

### New Branch Creation
   ```bash
   git checkout -b feature-name
   git push origin feature-name
```

### Pull Requests\Code Reviews
When merging into another branch, a pull request is necessary before this happens. It must include a short description of what has been changed. At least one other team member must review the code for quality and consistency, and approve the request. Once a feature has been, tested, the branch can be merged into `main`.
