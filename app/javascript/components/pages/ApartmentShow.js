import React, { Component } from 'react'
import {
    Card,
    CardImg,
    CardBody,
    CardTitle,
    CardText,
    Button,
  } from "reactstrap";


class ApartmentShow extends Component {
  render() {
    let { apartment } = this.props
    return (
      <>
        {apartment &&
        <Card>
            <CardImg src={apartment.image}/>
        </Card>
        }
      </>
    )
  }
}

export default ApartmentShow