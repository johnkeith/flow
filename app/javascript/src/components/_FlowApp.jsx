import Authenticated from "./authenticated/Authenticated"
import LoadingOverlay from "./LoadingOverlay"
import React from "react"
import { BrowserRouter as Router, Route, Redirect, Switch } from "react-router-dom"
import Unauthenticated from "./unauthenticated/Unauthenticated"

class FlowApp extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      isLoading: true,
      isAuthenticated: false
    }
  }

  componentWillMount() {
    const isAuthenticated = this.determineAuthStatus()

    this.setState({ isAuthenticated, isLoading: false })
  }

  determineAuthStatus() {
    return true
  }

  render() {
    return (
      <Router>
        <Switch>
          <Route
            path="/"
            component={Unauthenticated}
            exact />
          <PrivateRoute
            isAuthenticated={this.state.isAuthenticated}
            path="/surveys"
            component={Authenticated} />
        </Switch>
      </Router>
    )
  }
}

// if it is loading, just show loading
// if it is loaded, then check authentication,
  // if authenticated, then show surveys at home
  // if unauthenticated, show unauthenticated view

const PrivateRoute = ({ component: Component, isAuthenticated, ...rest }) => (
  <Route {...rest} render={ props => (
    isAuthenticated ?
    <Component {...props} />
    :
    <Redirect to={{ pathname: "/", state: { from: props.location }}} />
  )} />
)

export default FlowApp