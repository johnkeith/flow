import React from "react"
import { NavLink, Route } from "react-router-dom"

const Authenticated = () => (
  <div className="columns">
    <Sidebar />
    <Main />
  </div>
)

const Sidebar = () => (
  <aside className="column is-one-fifth aside">
    <nav className="menu">
      <p class="menu-label">Menu</p>
      <ul className="menu-list">
        <li>
          <NavLink to="/surveys">Surveys</NavLink>
        </li>
        <li>
          <NavLink to="/teams">Teams</NavLink>
        </li>
        <li>
          <NavLink to="/team_members">Team Members</NavLink>
        </li>
      </ul>
    </nav>
  </aside>
)

const Main = () => (
  <div className="column">
    <Route path="/" component={Surveys} exact />
    <Route path="/surveys" component={Surveys} />
    <Route path="/teams" component={Teams} />
    <Route path="/team_members" component={TeamMembers} />
  </div>
)

const Surveys = () => (
  <div>Hello Surveys</div>
)

const Teams = () => (
  <div>Hello Teams</div>
)

const TeamMembers = () => (
  <div>Hello Team Members</div>
)

export default Authenticated