import React from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'
import style from './style.sass'

export default class HelloAPI extends React.Component {
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
      <div className={style['test']}>
        <h1 className="is-size-1">Hello, { this.state.nameFromAPI }</h1>
      </div>
    );
  }
}