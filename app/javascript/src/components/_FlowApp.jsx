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
    return false
  }

  render() {
    return (
      <Router>
        <Switch>
          {
            this.state.isLoading ?
            <Route path="/" component={LoadingOverlay} /> : null
          }
          {
            !this.state.isLoading && this.state.isAuthenticated ?
            <Route path="/" component={Authenticated} /> : null
          }
          {
            !this.state.isLoading && !this.state.isAuthenticated ?
            <Route path="/" component={Unauthenticated} exact /> : null
          }
        </Switch>
      </Router>
    )
  }
}

// const PrivateRoute = ({ component: Component, isAuthenticated, ...rest }) => (
//   <Route {...rest} render={ props => (
//     isAuthenticated ?
//     <Component {...props} />
//     :
//     <Redirect to={{ pathname: "/", state: { from: props.location }}} />
//   )} />
// )

export default FlowApp