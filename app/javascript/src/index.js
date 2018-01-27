import React from 'react'
import PropTypes from 'prop-types'
import ReactDOM from 'react-dom'

class HelloAPI extends React.Component {
  constructor(props) {
    super(props);
  }

  componentWillMount() {
    console.log('About to mount component')
  }

  render() {
    return (
      <div>
        <h1>Hello, { this.state.nameFromAPI }</h1>
      </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <HelloAPI />,
    document.body.appendChild(document.createElement('div')),
  )
})