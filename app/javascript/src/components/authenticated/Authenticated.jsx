import React from "react"
import { NavLink, Route } from "react-router-dom"

const Authenticated = () => (
  <div className="columns">
    <Sidebar />
    <Main />
  </div>
)

const Sidebar = () => (
  <aside className="menu column is-one-third">
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
  </aside>
)

const Main = () => (
  <div className="column">
    Hello App.
  </div>
)

export default Authenticated