<form name="login" aciton="/login" method="POST">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<fieldset>
		<label for="username">Username</lable>
		<input type="text" id="username" name="username" />
		<label for="password">Password</label>
		<input type="password" id="password" name="password" />
		
		<button type="submit" class="btn">Log in</button>
	</fieldset>
</form>

<a href="/register" class="btn-link">Create a new account</a>