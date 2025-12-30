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
		
		.actions a {
		    margin-right: 10px;
		    color: var(--accent);
		    cursor: pointer;
		    text-decoration: none;
		    font-weight: bold;
		}

		.actions a.delete {
		    color: #f87171;
		}

		.modal {
		    position: fixed;
		    inset: 0;
		    background: rgba(0,0,0,0.6);
		    display: none;
		    align-items: center;
		    justify-content: center;
		}

		.modal-content {
		    background: var(--card);
		    padding: 22px;
		    border-radius: 12px;
		    width: 300px;
		}

		.modal-content h3 {
		    margin-top: 0;
		    text-align: center;
		}

		.modal-content input {
		    width: 100%;
		    padding: 8px;
		    margin: 8px 0;
		    border-radius: 6px;
		    border: none;
		}

		.modal-content button {
		    width: 100%;
		    padding: 10px;
		    background: var(--accent);
		    border: none;
		    color: #000;
		    font-weight: bold;
		    border-radius: 6px;
		    cursor: pointer;
		}

		.close {
		    text-align: right;
		    cursor: pointer;
		    color: var(--muted);
		    font-size: 14px;
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
				<th>Actions</th>
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
		            <td class="actions">
		                <a onclick="openModal('<%= t.getId() %>',
		                                      '<%= t.getName() %>',
		                                      '<%= t.getDuration() %>')">
		                    Update
		                </a>
		                <a class="delete"
		                   href="deleteTask?id=<%= t.getId() %>"
		                   onclick="return confirm('Delete this task?')">
		                    Delete
		                </a>
		            </td>
		            <td><%= t.getId() %></td>
		            <td><%= t.getName() %></td>
		            <td><%= t.getDuration() %></td>
		        </tr>
		<%
		        }
		    } else {
		%>
		        <tr>
		            <td colspan="4" class="empty">No tasks found</td>
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

<div class="modal" id="modal">
    <div class="modal-content">
        <div class="close" onclick="closeModal()">✕</div>

        <h3>Edit Task</h3>

		<form action="${pageContext.request.contextPath}/updateTask" method="post">

            <input type="hidden" name="id" id="taskId">

            <input type="text" name="name" id="taskName" required>
            <input type="text" name="duration" id="taskDuration" required>

            <button type="submit">Update</button>
        </form>
    </div>
</div>

<script>
    function openModal(id, name, duration) {
        document.getElementById("taskId").value = id;
        document.getElementById("taskName").value = name;
        document.getElementById("taskDuration").value = duration;
        document.getElementById("modal").style.display = "flex";
    }

    function closeModal() {
        document.getElementById("modal").style.display = "none";
    }
</script>


</body>
</html>
