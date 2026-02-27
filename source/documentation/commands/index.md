---
title: Commands
---

# Commands

### Global options
- **-i, --interactive** — Interactive menu (`poco -i`): start/stop, Kubernetes, Helm, catalog.
- **-V, --verbose** — More output (e.g. merged compose for up/down).
- **-VV, --no-matrix** — No matrix effect for up/down; show full log. Implies verbose.
- **-a, --all** — With `poco status`: include stopped projects.
- **-q, --quiet** — Less output.
- **--offline** — Offline mode.
- **--always-update** — Project repository handled by user.

**Usage:** `poco [options] [-i] [<command> [<args>...]]` — Use `project/plan` format (e.g. `nginx/default`) for project commands.

### poco
{% raw %}
<table>
    <thead>
        <tr>
            <th width="40%"><b>Command</b></th>
            <th width="60%"><b>Description</b></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><b><code>poco config [&lt;project/plan&gt;]</code></b></td>
            <td>
                <p>Print full Docker compose configuration. E.g. <code>poco config nginx/default</code>.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco status [-a]</code></b></td>
            <td>
                <p>List Docker Compose projects currently running (from any directory). Use <code>-a</code> / <code>--all</code> to include stopped projects.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco clean</code></b></td>
            <td><p>Clean all containers and images from the local Docker repository.</p></td>
        </tr>
        <tr>
            <td><b><code>poco init [&lt;name&gt;]</code></b></td>
            <td>
                <p>Initialize poco project: create poco.yml and docker-compose.yml if they don't exist. Same as <code>poco project init</code>.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco install [&lt;project/plan&gt;]</code></b></td>
            <td>
                <p>Clone project from remote (if not present locally) and run install scripts.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco (start|up) [&lt;project/plan&gt;]</code></b></td>
            <td>
                <p>Start project. Use <code>-V</code> for verbose, <code>-VV</code> or <code>--no-matrix</code> for full log.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco (stop|down) [&lt;project/plan&gt;]</code></b></td>
            <td>
                <p>Stop project. Use <code>-V</code>, <code>-VV</code> or <code>--no-matrix</code>.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco restart [&lt;project/plan&gt;]</code></b></td>
            <td>
                <p>Restart project (docker, helm or kubernetes).</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco (log|logs) [&lt;project/plan&gt;]</code></b></td>
            <td>
                <p>Print container logs of the project.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco build [&lt;project/plan&gt;]</code></b></td>
            <td>
                <p>Build containers for the project and plan.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco ps [&lt;project/plan&gt;]</code></b></td>
            <td>
                <p>Print container status. E.g. <code>poco ps nginx</code> (default plan) or <code>poco ps nginx/test</code>.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco plan ls [&lt;name&gt;]</code></b></td>
            <td>
                <p>List available plans of the project. E.g. <code>poco plan ls nginx</code>.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco pull [&lt;project/plan&gt;]</code></b></td>
            <td>
                <p>Pull images for the project. Docker only.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco branch &lt;name&gt; &lt;branch&gt; [-f]</code></b></td>
            <td>
                <p>Switch git branch of a project. E.g. <code>poco branch nginx master</code>. <code>-f</code> force.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco branches [&lt;name&gt;]</code></b></td>
            <td>
                <p>List git branches of the project.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco pack [&lt;project/plan&gt;]</code></b></td>
            <td>
                <p>Pack project plan config and docker images into an archive.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco unpack [&lt;name&gt;]</code></b></td>
            <td>
                <p>Unpack .poco archive and install images to local repository.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco checkout &lt;name&gt;</code></b></td>
            <td>
                <p>Checkout project from the catalog.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco catalog [&lt;name&gt;]</code></b></td>
            <td>
                <p>List projects in catalog(s). Same as <code>poco project ls</code>. Optional <code>name</code> filters by repo.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco catalog-update</code></b></td>
            <td>
                <p>Refresh catalog from repository. Same as <code>poco repo pull</code>.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco check-version</code></b></td>
            <td>
                <p>Check for poco updates.</p>
            </td>
        </tr>
    </tbody>
</table>
{% endraw %}

### Kubernetes and Helm (poco)
{% raw %}
<table>
    <thead>
        <tr>
            <th width="40%"><b>Command</b></th>
            <th width="60%"><b>Description</b></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><b><code>poco kubectx [&lt;context&gt;]</code></b></td>
            <td>List contexts; or switch to <code>&lt;context&gt;</code>. Use <code>-i</code> to choose interactively.</td>
        </tr>
        <tr>
            <td><b><code>poco kubens [&lt;namespace&gt;]</code></b></td>
            <td>List namespaces; or switch to <code>&lt;namespace&gt;</code>. Use <code>-i</code> to choose interactively.</td>
        </tr>
        <tr>
            <td><b><code>poco kube-get &lt;resource&gt; [name]</code></b></td>
            <td>Shortcut for <code>kubectl get</code>. E.g. <code>poco kube-get pods</code>, <code>poco kube-get ns</code>. Use <code>-n &lt;ns&gt;</code> or <code>-A</code> for all namespaces.</td>
        </tr>
        <tr>
            <td><b><code>poco preset list</code></b></td>
            <td>List saved presets (context + namespace). Config: <code>~/.poco/presets.yml</code>.</td>
        </tr>
        <tr>
            <td><b><code>poco preset use [&lt;name&gt;]</code></b></td>
            <td>Switch to preset. Use <code>-i</code> to choose from list interactively.</td>
        </tr>
        <tr>
            <td><b><code>poco preset save &lt;name&gt;</code></b></td>
            <td>Save current context and namespace as a preset.</td>
        </tr>
        <tr>
            <td><b><code>poco helm-repos</code></b></td>
            <td>List Helm repositories.</td>
        </tr>
        <tr>
            <td><b><code>poco helm-list</code></b></td>
            <td>List Helm releases. Use <code>--all-namespaces</code> for all; <code>-i</code> to pick one and show status.</td>
        </tr>
    </tbody>
</table>
{% endraw %}

### poco Repo
{% raw %}
<table>
    <thead>
        <tr>
            <th width="40%"><b>Command</b></th>
            <th width="60%"><b>Description</b></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><b><code>poco repo ls</code></b></td>
            <td>
                <p>List the configs of catalogs.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco repo (add|modify) &lt;name&gt; &lt;git-url&gt; [&lt;branch&gt;] [&lt;file&gt;]</code></b></td>
            <td>
                <p>Add/Modify new catalog to the config.</p>
                <p><code>&lt;name&gt;</code> - Name of the catalogue.</p>
                <p><code>&lt;git-url&gt;</code> - URL of catalog's GIT repository.</p>
                <p><code>[&lt;branch&gt;]</code> - Name of the branch that should be checked out. (default : master)</p>
                <p><code>[&lt;file&gt;]</code> - Name of the catalog file in the repository. (default: poco-catalog.yml)</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco repo pull</code></b></td>
            <td>
                <p>Refresh catalog from repository. Same as <code>poco catalog-update</code>.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco repo (remove|rm) [&lt;name&gt;]</code></b></td>
            <td>
                <p>Remove catalog from local config.</p>
                <p><code>&lt;name&gt;</code> - Name of the catalog.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco repo branch &lt;branch&gt; [&lt;name&gt;] [-f]</code></b></td>
            <td>
                <p>Switch catalog branch if it is using GIT.</p>
                <p><code>&lt;branch&gt;</code> - Name of the branch that should be checked out.</p>
                <p><code>[&lt;name&gt;]</code> - Name of the catalog.</p>
                <p><code>-f</code> — Force switch.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco repo branches [&lt;name&gt;]</code></b></td>
            <td>
                <p>List all available branches of catalog's GIT repository.</p>
                <p><code>[&lt;name&gt;]</code> - Name of the catalog.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco repo push [&lt;name&gt;]</code></b></td>
            <td>
                <p>Push changes into catalog's remote Git repository.</p>
                <p><code>name</code> - Name of the catalog.</p>
            </td>
        </tr>
    </tbody>
</table>
{% endraw %}

### poco Project
{% raw %}
<table>
    <thead> 
        <tr>
            <th width="40%"><b>Command</b></th>
            <th width="60%"><b>Description</b></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><b><code>poco project add [&lt;target-dir&gt;] [&lt;catalog&gt;]</code></b></td>
            <td>
                <p>Add directory to catalog.</p>
                <p><code>[&lt;target-dir&gt;]</code> - Target directory that will be added to the catalog. Default is the current directory.</p>
                <p><code>[&lt;catalog&gt;]</code> - Name of the catalog.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco project init [&lt;project&gt;]</code></b></td>
            <td>
                <p>Create poco.yml and docker-compose.yml if they don't exist.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project that will be added to the catalog</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco project ls</code></b></td>
            <td>
                <p>List all projects from the catalog(s).</p>
            </td>
        </tr>
        <tr>
            <td><b><code>poco project (remove|rm) &lt;name&gt;</code></b></td>
            <td>
                <p>Remove project from the catalog. E.g. <code>poco project remove nginx</code>.</p>
            </td>
        </tr>
    </tbody>
</table>
{% endraw %}

**Tip:** Run `poco -?` or `poco help <command>` for the latest usage.
