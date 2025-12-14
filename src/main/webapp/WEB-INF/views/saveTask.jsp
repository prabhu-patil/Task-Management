<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>

    <style>
        :root {
            --bg: #0f172a;
            --card: #1e293b;
            --accent: #38bdf8;
            --text: #e2e8f0;
            --muted: #94a3b8;
        }

        body {
            margin: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #0f172a, #1e293b);
            font-family: Arial, sans-serif;
            color: var(--text);
        }

        .card {
            width: 360px;
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
            margin-bottom: 22px;
            font-weight: 600;
        }

        label {
            font-size: 14px;
            color: var(--muted);
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 18px;
            border: none;
            border-radius: 8px;
            background: #0f172a;
            color: var(--text);
            outline: none;
        }

        input:focus {
            border: 1px solid var(--accent);
        }

        button, .btn {
            width: 100%;
            padding: 10px;
            border: none;
            background: var(--accent);
            color: #0f172a;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.2s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        button:hover, .btn:hover {
            background: #7dd3fc;
        }

        .back {
            margin-top: 16px;
            text-align: center;
        }

        .back a {
            color: var(--accent);
            font-size: 14px;
            text-decoration: none;
            font-weight: bold;
        }

        .back a:hover {
            text-decoration: underline;
        }
    </style>

</head>
<body>

<div class="card">
    <h2>Add New Task</h2>

    <form action="createTask" method="post">

        <label>Task Name</label>
        <input type="text" name="name" required>

        <label>Duration (Hours)</label>
        <input type="number" name="duration" min="1" required>

        <button type="submit">Save Task</button>
    </form>
</div>

</body>
</html>
