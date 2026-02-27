# Poco
{% raw %}
<div class="table-wrap"> 
  <table>
    <thead>
    <tr>
      <th width="40%"><b>Command</b></th>
      <th width="60%"><b>Description</b></th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><b><code>poco init [&lt;name&gt;]</code></b></td>
      <td>
        <p>Initialize poco project, poco.yml and docker-compose.yml will be created if they don't exist.</p>
        <p><code>[&lt;name&gt;]</code> - Name of the project.</p>
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
        <p>Start project with the default or defined plan.</p>
      </td>
    </tr>
    <tr>
      <td><b><code>poco (stop|down) [&lt;project/plan&gt;]</code></b></td>
      <td>
        <p>Stop project with the default or defined plan.</p>
      </td>
    </tr>
    <tr>
      <td><b><code>poco restart [&lt;project/plan&gt;]</code></b></td>
      <td>
        <p>Restart project with the default or defined plan.</p>
      </td>
    </tr>
    <tr>
      <td><b><code>poco (log|logs) [&lt;project/plan&gt;]</code></b></td>
      <td>
        <p>Print container logs of the project.</p>
      </td>
    </tr>
    <tr>
      <td><b><code>poco build [&lt;name&gt;] [&lt;plan&gt;]</code></b></td>
      <td>
        <p>Build containers for the defined project and plan.</p>
        <p><code>[&lt;name&gt;]</code> - Name of the project.</p>
        <p><code>[&lt;plan&gt;]</code> - Name of the project's plan.</p>
      </td>
    </tr>
    <tr>
      <td><b><code>poco ps [&lt;project/plan&gt;]</code></b></td>
      <td>
        <p>Print container status for the defined project and plan.</p>
      </td>
    </tr>
    <tr>
      <td><b><code>poco plan ls [&lt;name&gt;]</code></b></td>
      <td>
        <p>List available plans of the project.</p>
      </td>
    </tr>
    <tr>
      <td><b><code>poco pull [&lt;project/plan&gt;]</code></b></td>
      <td>
        <p>Pull images for the project. Docker only.</p>
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
        <p><code>[&lt;name&gt;]</code> - Name of the archive.</p>
      </td>
    </tr>
    <tr>
      <td><b><code>poco clean</code></b></td>
      <td><p>Clean all containers and images from the local Docker repository.</p></td>
    </tr>
    </tbody>
  </table>
</div>
{% endraw %}
