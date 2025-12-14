<%@ page import="java.util.List" %>
<%@ page import="TaskManagement.entity.Task" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Tasks</title>

    <style>
        :root {
            --bg: #0f172a;
            --card: #1e293b;
            --accent: #38bdf8;
            --text: #e2e8f0;
            --muted: #94a3b8;
            --row: #0f172a;
        }

        body {
            margin: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #0f172a, #1e293b);
            font-family: Arial, sans-serif;
            color: var(--text);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            width: 80%;
            max-width: 900px;
            background: var(--card);
            padding: 28px;
            border-radius: 14px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.45);
            animation: fadeIn 0.6s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            margin-bottom: 24px;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 10px;
        }

        thead {
            background: #020617;
        }

        th {
            padding: 12px;
            text-align: left;
            font-size: 14px;
            color: var(--muted);
            text-transform: uppercase;
        }

        td {
            padding: 12px;
            background: var(--row);
            border-top: 1px solid rgba(255,255,255,0.04);
        }

        tr:hover td {
            background: rgba(56,189,248,0.08);
        }

        .empty {
            text-align: center;
            color: var(--muted);
            padding: 20px;
        }

        .back {
            margin-top: 20px;
            text-align: center;
        }

        .back a {
            color: var(--accent);
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }

        .back a:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .card {
                width: 95%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="card">
    <h2>All Tasks</h2>

    <%
        List<Task> list = (List<Task>) request.getAttribute("list");
    %>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Duration (hrs)</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (list != null && !list.isEmpty()) {
                for (Task t : list) {
        %>
            <tr>
                <td><%= t.getId() %></td>
                <td><%= t.getName() %></td>
                <td><%= t.getDuration() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="3" class="empty">No tasks found</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div class="back">
        <a href="${pageContext.request.contextPath}/backToHome">Back to Home</a>
    </div>
</div>

</body>
</html>
