---
title: Commands
---

# Commands

### Global options
- **-i, --interactive** — Interactive menu (`poco -i`): start/stop, Kubernetes, Helm, catalog.
- **-V, --verbose** — More output (e.g. merged compose for up/down).
- **-VV, --no-matrix** — No matrix effect for up/down; show full log. Implies verbose.
- **-a, --all** — With `poco status`: include stopped projects.
- **-q, --quiet** — Less output. **--offline** — Offline mode.

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
            <td><b><code>$:~ poco config [&lt;project&gt;] [&lt;plan&gt;]</code></b></td>
            <td>
                <p>Print full Docker compose configuration for a project's plan.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
                <p><code>[&lt;plan&gt;]</code> - Name of the project's plan</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco status [-a]</code></b></td>
            <td>
                <p>List Docker Compose projects currently running (from any directory). Use <code>-a</code> or <code>--all</code> to include stopped projects.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco clean</code></b></td>
            <td><p>Clean all containers and images from the local Docker repository.</p></td>
        </tr>
        <tr>
            <td><b><code>$:~ poco init [&lt;project&gt;]</code></b></td>
            <td>
                <p>Initialize poco project, poco.yml and docker-compose.yml will be created if they don't exist.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco install [&lt;project&gt;] [&lt;plan&gt;]</code></b></td>
            <td>
                <p>Clone projects from a remote repository, run install scripts.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
                <p><code>[&lt;plan&gt;]</code> - Name of the project's plan</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco (start|up) [&lt;project&gt;] [&lt;plan&gt;]</code></b></td>
            <td>
                <p>Start poco project with the default or defined plan.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
                <p><code>[&lt;plan&gt;]</code> - Name of the project's plan</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco (stop|down) [&lt;project&gt;] [&lt;plan&gt;]</code></b></td>
            <td>
                <p>Stop project with the default or defined plan.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
                <p><code>[&lt;plan&gt;]</code> - Name of the project's plan</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco restart [&lt;project&gt;] [&lt;plan&gt;]</code></b></td>
            <td>
            <p>Restart project with the default or defined plan.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
                <p><code>[&lt;plan&gt;]</code> - Name of the project's plan</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco (log|logs) [&lt;project&gt;] [&lt;plan&gt;]</code></b></td>
            <td>
            <p>Print docker containers logs of the current project with the default or defined plan.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
                <p><code>[&lt;plan&gt;]</code> - Name of the project's plan</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco build [&lt;project&gt;] [&lt;plan&gt;]</code></b></td>
            <td>
                <p>Build containers depends defined project and plan.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
                <p><code>[&lt;plan&gt;]</code> - Name of the project's plan</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco ps [&lt;project&gt;] [&lt;plan&gt;]</code></b></td>
            <td>
                <p>Print containers statuses which depends defined project and plan.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
                <p><code>[&lt;plan&gt;]</code> - Name of the project's plan</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco plan ls [&lt;project&gt;]</code></b></td>
            <td>
                <p>Print all available plans of the project.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco pull [&lt;project&gt;] [&lt;plan&gt;]</code></b></td>
            <td>
                <p>Pull all necessary images for the project with the defined or default plan.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
                <p><code>[&lt;plan&gt;]</code> - Name of the project's plan</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco branches [&lt;project&gt;]</code></b></td>
            <td>
                <p>List all available git branches of the project.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco pack [&lt;project&gt;] [&lt;plan&gt;]</code></b></td>
            <td>
                <p>Pack the selected project's plan configuration with docker images into an archive.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
                <p><code>[&lt;plan&gt;]</code> - Name of the project's plan</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco unpack [&lt;project&gt;]</code></b></td>
            <td>
                <p>Unpack archive, install images to local repository.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project in the catalog</p>
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
            <td><b><code>$:~ poco kubectx [&lt;context&gt;]</code></b></td>
            <td>List contexts; or switch to <code>&lt;context&gt;</code>. Use <code>-i</code> to choose interactively.</td>
        </tr>
        <tr>
            <td><b><code>$:~ poco kubens [&lt;namespace&gt;]</code></b></td>
            <td>List namespaces; or switch to <code>&lt;namespace&gt;</code>. Use <code>-i</code> to choose interactively.</td>
        </tr>
        <tr>
            <td><b><code>$:~ poco kube-get &lt;resource&gt; [name]</code></b></td>
            <td>Shortcut for <code>kubectl get</code>. E.g. <code>poco kube-get pods</code>, <code>poco kube-get ns</code>. Use <code>-n &lt;ns&gt;</code> or <code>-A</code> for all namespaces.</td>
        </tr>
        <tr>
            <td><b><code>$:~ poco preset list</code></b></td>
            <td>List saved presets (context + namespace). Config: <code>~/.poco/presets.yml</code>.</td>
        </tr>
        <tr>
            <td><b><code>$:~ poco preset use &lt;name&gt;</code></b></td>
            <td>Switch to preset (context and namespace). Use <code>-i</code> to choose from list.</td>
        </tr>
        <tr>
            <td><b><code>$:~ poco preset save &lt;name&gt;</code></b></td>
            <td>Save current context and namespace as a preset.</td>
        </tr>
        <tr>
            <td><b><code>$:~ poco helm-repos</code></b></td>
            <td>List Helm repositories.</td>
        </tr>
        <tr>
            <td><b><code>$:~ poco helm-list</code></b></td>
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
    <thead>
    <tbody>
        <tr>
            <td><b><code>$:~ poco repo init</code></b></td>
            <td>
                <p>Initialize default environment and sample catalog.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco repo ls</code></b></td>
            <td>
                <p>List the configs of catalogs.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~  poco repo (add|modify) &lt;name&gt; &lt;git-url&gt; [&lt;branch&gt;] [&lt;file&gt;]</code></b></td>
            <td>
                <p>Add/Modify new catalog to the config.</p>
                <p><code>&lt;name&gt;</code> - Name of the catalogue.</p>
                <p><code>&lt;git-url&gt;</code> - URL of catalog's GIT repository.</p>
                <p><code>[&lt;branch&gt;]</code> - Name of the branch that should be checked out. (default : master)</p>
                <p><code>[&lt;file&gt;]</code> - Name of the catalog file in the repository. (default: poco-catalog.yml)</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco repo (remove|rm) &lt;name&gt;</code></b></td>
            <td>
                <p>Remove catalog from local config.</p>
                <p><code>&lt;name&gt;</code> - Name of the catalog.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco repo branch &lt;branch&gt; [&lt;name&gt;] [-f]</code></b></td>
            <td>
                <p>Switch catalog branch if it is using GIT.</p>
                <p><code>&lt;branch&gt;</code> - Name of the branch that should be checked out.</p>
                <p><code>[&lt;name&gt;]</code> - Name of the catalog.</p>
                <p><code>-f</code> - Name of the project's plan</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco repo branches [&lt;name&gt;]</code></b></td>
            <td>
                <p>List all available branches of catalog's GIT repository.</p>
                <p><code>[&lt;name&gt;]</code> - Name of the catalog.</p>
            </td>
        </tr>
        <tr>
            <td><b><code>$:~ poco repo push [&lt;name&gt;]</code></b></td>
            <td>
                <p>Push changes into catalog's remote GIT repository</p>
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
                <p>Create poco.yml and docker-compose.yml to a project if aren't exists.</p>
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
            <td><b><code>poco project remove [&lt;project&gt;]</code></b></td>
            <td>
                <p>Remove project from the catalog.</p>
                <p><code>[&lt;project&gt;]</code> - Name of the project that will be removed</p>
            </td>
        </tr>
    </tbody>
</table>
{% endraw %}
