import React, { Component } from 'react'
import { Card, CardImg, CardBody, CardTitle, CardSubtitle, Button, Row, Col } from 'reactstrap'


class ProtectedApartmentIndex extends Component {
  render() {
    const {
        logged_in,
        current_user,
      } = this.props
    return (
      <>
        <h2>My Apartment</h2>
        <Col sm="3">
            {this.props.apartments && this.props.apartments.map(apartment => {
              return(
              <div key ={apartment.id}>
                <Card>
                  <CardImg top width="100%" src={apartment.image} />
                  <CardBody>
                    <CardTitle className='pagecard-title'>{apartment.name}</CardTitle>
                    <CardSubtitle> {apartment.street} {apartment.city} {apartment.state} 
                    </CardSubtitle>                   
                    <Button><a href={`/apartmentshow/${apartment.id}`} >More info here</a></Button>     
                  </CardBody>
                </Card>
              </div>
              )
              })}
          </Col>
      </>
    )
  }
}

export default ProtectedApartmentIndex