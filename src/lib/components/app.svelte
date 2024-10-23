<script>
  import { Router, Route } from 'svelte-routing';
  import SignUp from './SignUp.svelte';
	import IsiDataSignUp from './IsiDataSignUp.svelte';
</script>

<Router>
  <Route path="/" component={SignUp} />
  <Route path="/full-registration" component={IsiDataSignUp} />
</Router>
