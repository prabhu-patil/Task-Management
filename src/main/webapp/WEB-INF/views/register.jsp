<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>

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
            width: 340px;
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
            margin-bottom: 20px;
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

        button {
            width: 100%;
            padding: 10px;
            border: none;
            background: var(--accent);
            color: #0f172a;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.2s ease;
        }

        button:hover {
            background: #7dd3fc;
        }

        /* login button section */
        .login {
            margin-top: 18px;
            text-align: center;
            font-size: 14px;
            color: var(--muted);
        }

        .login-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 24px;
            background: var(--accent);
            color: #0f172a;
            font-weight: bold;
            border-radius: 8px;
            text-decoration: none;
            transition: 0.2s ease;
        }

        .login-btn:hover {
            background: #7dd3fc;
        }
    </style>
</head>
<body>

<div class="card"> 
    <h2>Register</h2>

    <form action="${pageContext.request.contextPath}/createuser" method="post">

        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit">Register</button>
    </form>

    <div class="login" method="post">
        <div>Already have an account?</div>

        <a href="${pageContext.request.contextPath}/login" class="login-btn">
            Login
        </a>
    </div>
</div>

</body>
</html>
