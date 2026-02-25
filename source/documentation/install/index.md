---
title: Install
---
# Install Poco

Before installing Poco you need Git, Python, and (for Compose) Docker. Kubernetes and Helm are optional.

**Supported platforms:** Linux, Mac OS, Windows (including Git Bash).

### Install Git
https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

### Install Python
**Python 3.12.3 or newer** is required. (Supported version: 3.14.3.)  
https://www.python.org/downloads/

### Install Docker (for Compose)
We recommend Docker 17.x or later. Docker Compose V2 (e.g. `docker compose`) is required for Compose support.  
- Ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/  
- Mac: https://docs.docker.com/docker-for-mac/install/  
- Windows: https://docs.docker.com/docker-for-windows/install/

### Install kubectl (optional, for Kubernetes)
Only needed for Kubernetes support.  
https://kubernetes.io/docs/tasks/tools/install-kubectl/

### Install Helm (optional)
Only needed for Helm support.  
https://github.com/kubernetes/helm

---

### Install Poco

**Using pip:**
```bash
pip install poco
```

**Using the install script (one-liner):**
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/shiwaforce/poco/master/install.sh)"
```
The script installs Poco (e.g. via pipx) on Linux, Mac, WSL, and Windows Git Bash.

**Install script options:**

| Option | Description |
|--------|-------------|
| **Full reset** | Remove previous install, then install fresh: add `-- --reset` after the URL. |
| **Self-update** | Update the install script itself: add `-- --update` (when run from a saved script file). |
| **Dev branch** | Install from `dev` branch: add `-- dev`. |

### Update Poco
```bash
pip install -U poco
```
Or run the install script again to get the latest release.
