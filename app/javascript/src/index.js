import React from 'react'
import PropTypes from 'prop-types'
import ReactDOM from 'react-dom'
import axios from 'axios'

class HelloAPI extends React.Component {
  constructor(props) {
    super(props);
    this.state = {}
  }

  componentWillMount() {
    console.log('About to mount component')
    axios.get('/api/v1/test')
      .then((response) => {
        this.setState({
          nameFromAPI: response.data.name
        })
      })
      .catch((error) => {
        console.log(error);
      })
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