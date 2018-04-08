import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Image1 from '../images/react.png'
import Image2 from '../images/forward.svg'

const Hello = props => (
  <div>
    <div className='colorItRed'>Hello {props.name}!</div>
    <img src={Image1} />
    <Image2 />
  </div>
)

Hello.defaultProps = {
  name: 'David'
}

Hello.propTypes = {
  name: PropTypes.string
}

export default Hello