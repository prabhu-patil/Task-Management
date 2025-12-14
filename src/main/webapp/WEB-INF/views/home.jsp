
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Task Management - Home</title>

  <!-- Optional: Google font -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">

  <style>
    :root{
      --bg:#0f1724;
      --card:#0b1220;
      --muted:#9aa4b2;
      --accent1:#6ee7b7;
      --accent2:#60a5fa;
      --glass: rgba(255,255,255,0.04);
      --radius:14px;
      --shadow: 0 10px 30px rgba(2,6,23,0.6);
      --surface-shadow: 0 6px 18px rgba(2,6,23,0.5);
      font-family: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
    }

    html,body{
      height:100%;
      margin:0;
      background: radial-gradient(1000px 400px at 10% 10%, rgba(96,165,250,0.08), transparent 8%),
                  radial-gradient(900px 300px at 90% 90%, rgba(110,231,183,0.04), transparent 8%),
                  linear-gradient(180deg, #071028 0%, #041021 100%);
      color:#e6eef8;
      -webkit-font-smoothing:antialiased;
      -moz-osx-font-smoothing:grayscale;
    }

    .container{
      max-width:980px;
      margin:40px auto;
      padding:28px;
      display:grid;
      grid-template-columns: 1fr 360px;
      gap:28px;
      align-items:start;
    }

    header.app-header{
      grid-column: 1 / -1;
      display:flex;
      align-items:center;
      justify-content:space-between;
      gap:16px;
      margin-bottom:6px;
    }

    .brand{
      display:flex;
      gap:14px;
      align-items:center;
    }

    .logo{
      width:56px;
      height:56px;
      border-radius:12px;
      background: linear-gradient(135deg,var(--accent1), var(--accent2));
      display:flex;
      align-items:center;
      justify-content:center;
      box-shadow: var(--shadow);
      font-weight:700;
      color:#022029;
      font-size:20px;
      letter-spacing:0.6px;
    }

    h1{ margin:0; font-size:20px; font-weight:600; }
    p.lead { margin:0; color:var(--muted); font-size:13px; }

    /* Main card */
    .main-card{
      background: linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));
      border-radius: var(--radius);
      padding:22px;
      box-shadow: var(--surface-shadow);
      min-height:220px;
    }

    .welcome{
      display:flex;
      align-items:center;
      justify-content:space-between;
      gap:18px;
    }

    .welcome-text h2{ margin:0; font-size:18px; }
    .welcome-text p{ margin:6px 0 0 0; color:var(--muted); font-size:13px; }

    .actions{
      margin-top:18px;
      display:flex;
      gap:12px;
      flex-wrap:wrap;
      align-items:center;
    }

    .btn {
      appearance:none;
      border:0;
      padding:10px 16px;
      border-radius:10px;
      font-weight:600;
      cursor:pointer;
      text-decoration:none;
      display:inline-flex;
      gap:10px;
      align-items:center;
      transition:transform .14s ease, box-shadow .14s ease;
      box-shadow: 0 6px 18px rgba(2,6,23,0.45);
      color:#051423;
      background:linear-gradient(90deg,var(--accent1),var(--accent2));
    }

    .btn:active { transform:translateY(1px); }
    .btn.secondary{
      background:transparent;
      color:var(--accent2);
      border:1px solid rgba(96,165,250,0.12);
      box-shadow:none;
    }

    /* Sidebar */
    .sidebar{
      background: linear-gradient(180deg, rgba(255,255,255,0.012), rgba(255,255,255,0.01));
      border-radius: 12px;
      padding:18px;
      box-shadow: var(--surface-shadow);
      height:100%;
      display:flex;
      flex-direction:column;
      gap:12px;
    }

    .menu-title { font-size:13px; color:var(--muted); margin:0 0 4px 0; }

    .menu{
      list-style:none;
      margin:0;
      padding:0;
      display:flex;
      flex-direction:column;
      gap:10px;
    }

    .menu a {
      text-decoration:none;
      padding:10px 12px;
      border-radius:10px;
      display:flex;
      gap:12px;
      align-items:center;
      color: #cfe8ff;
      transition: background .14s ease, transform .12s ease;
      background:transparent;
      font-weight:600;
    }

    .menu a:hover{
      background: rgba(255,255,255,0.02);
      transform:translateY(-3px);
    }

    .menu svg{ width:18px; height:18px; opacity:0.9; }

    .help{
      margin-top:auto;
      padding-top:6px;
      border-top:1px dashed rgba(255,255,255,0.03);
      color:var(--muted);
      font-size:13px;
    }

    /* Responsive */
    @media (max-width:880px){
      .container{ grid-template-columns:1fr; padding:20px; margin:20px; }
      .logo{ width:48px; height:48px; }
    }
  </style>
</head>
<body>
  <div class="container">
    <header class="app-header">
      <div class="brand">
        <div class="logo">TM</div>
        <div>
          <h1>Task Management</h1>
          <p class="lead">Create, view, and manage your tasks quickly</p>
        </div>
      </div>

      <nav aria-label="User">
        <a class="btn secondary" href="${pageContext.request.contextPath}/logout" title="Logout">
          <!-- logout icon -->
          <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
          Logout
        </a>
      </nav>
    </header>

    <main class="main-card" role="main" aria-labelledby="welcome-heading">
      <div class="welcome">
        <div class="welcome-text">
          <h2 id="welcome-heading">Welcome back</h2>
          <p>Choose an action below to get started.</p>
        </div>

        <div style="text-align:right">
          <small style="color:var(--muted)">You are on: Home</small>
        </div>
      </div>

      <div class="actions" role="toolbar" aria-label="Primary actions">
        <a class="btn" href="${pageContext.request.contextPath}/createTask">
          <!-- plus icon -->
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
          Add New Task
        </a>

        <a class="btn secondary" href="${pageContext.request.contextPath}/viewTasks">
          <!-- list icon -->
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6"></line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
          View All Tasks
        </a>
      </div>

      <!-- optional quick info / tips -->
      <section style="margin-top:20px; color:var(--muted); font-size:14px; line-height:1.5;">
        <strong style="color:#dbeafe">Tip:</strong> Use "Add New Task" to enter name and duration. You can view and edit all tasks from "View All Tasks".
      </section>
    </main>

    <aside class="sidebar" aria-label="Navigation">
      <div>
        <p class="menu-title">Quick Actions</p>
        <ul class="menu" role="menu">
          <li role="none">
            <a role="menuitem" href="${pageContext.request.contextPath}/createTask">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" xmlns="http://www.w3.org/2000/svg"><path d="M12 5v14"></path><path d="M5 12h14"></path></svg>
              Add New Task
            </a>
          </li>

          <li role="none">
            <a role="menuitem" href="${pageContext.request.contextPath}/viewTasks">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" xmlns="http://www.w3.org/2000/svg"><path d="M3 7h18M3 12h18M3 17h18"></path></svg>
              View All Tasks
            </a>
          </li>

          <li role="none">
            <a role="menuitem" href="${pageContext.request.contextPath}/logout">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" xmlns="http://www.w3.org/2000/svg"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
              Logout
            </a>
          </li>
        </ul>
      </div>

      <div class="help">
        <div style="display:flex;gap:10px;align-items:center">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><path d="M12 16v.01"></path><path d="M12 8a4 4 0 0 0-1 7.874"></path></svg>
          <div>
            <div style="font-weight:600;color:#dbeafe">Need help?</div>
            <div style="font-size:13px;color:var(--muted)">Contact admin or check documentation.</div>
          </div>
        </div>
      </div>
    </aside>

  </div>
</body>
</html>
