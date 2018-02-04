import React from 'react'
import ReactDOM from 'react-dom'
import HelloAPI from './components/HelloAPI'
import 'bulma/css/bulma.css'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <HelloAPI />,
    document.getElementById('app'),
  )
})