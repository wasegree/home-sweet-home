import React from "react"
import Header from './components/Header'
import Footer from './components/Footer'
import Home from './pages/Home'
import ApartmentIndex from './pages/ApartmentIndex'
import ApartmentShow from './pages/ApartmentShow'
import ApartmentNew from './pages/ApartmentNew'
import ApartmentEdit from './pages/ApartmentEdit'
import NotFound from './pages/NotFound'
import ProtectedApartmentIndex from './pages/ProtectedApartmentIndex'
import {
  BrowserRouter as  Router,
  Route,
  Switch
} from 'react-router-dom'

class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      apartments: [],
    }
  }

  componentDidMount(){
    this.readApartment()
  }

  readApartment = () => {
    fetch("/apartments")
    .then(response => response.json())
    .then(apartmentsArray => this.setState({apartments: apartmentsArray}))
    .catch(errors => console.log("Apartment read errors", errors)) 
  }

  createApartment = (apartment) => {
    fetch("/apartments", {
      body: JSON.stringify(apartment),
      headers:{
        "Content-Type": "application/json"
      },
      method: "POST"
      
    })
    .then(response => response.json())
    .then(() => this.readApartment())
    .catch(errors => console.log("New apartment Error", errors))
  }

  updateApartment = (apartment, id) => {
    fetch(`/apartments/${id}`,{
      body: JSON.stringify(apartment),
      headers: {
        "Content-Type": "application/json"
      },
      method:"PATCH"
    })
    .then(response => response.json())
    .then(() => this.readApartment())
    .catch(errors => console.log("Update apartment errors", errors))
  }

  deleteApartment = (id) => {
    fetch(`/apartments/${id}`,{
      headers: {
        "Content-Type": "application/json"
      },
      method:"DELETE"
    })
    .then(response => response.json())
    .then(() => this.readApartment())
    .catch(errors => console.log("Delete apartment errors", errors))
  }




  render () {
    const {
      logged_in,
      current_user,
      new_user_route,
      sign_in_route,
      sign_out_route,
    } = this.props

    return (
      <Router>
        <Header {...this.props} />
        <Switch>
          <Route exact path="/" render={() => {
                    return <Home logged_in = {logged_in} sign_in_route = {sign_in_route} new_user_route = {new_user_route} />
                  }}  />
          <Route path="/apartmentedit/:id" render = {(props) => {
                  let id = +props.match.params.id
                  let apartment = this.state.apartments.find(apartmentObject => apartmentObject.id === id)
                  
                  return(
                    <ApartmentEdit
                      apartment = {apartment}
                      {...this.props}
                      updateApartment = {this.updateApartment}
                      current_user={current_user}
                    />
                  
                  )
                }} />
          <Route path="/apartmentindex"  render={() => <ApartmentIndex apartments = {this.state.apartments} logged_in = {logged_in} />} />

          <Route path="/myapartments" render={(props) =>{
            let myApartments = this.state.apartments.filter(apartment => apartment.user_id === current_user.id)
              return(
            <ProtectedApartmentIndex apartments={myApartments} />)}} />

              <Route path="/apartmentshow/:id" render={(props) => {
                let id = props.match.params.id
                let apartment = this.state.apartments.find(apartment => apartment.id === +id)
                return <ApartmentShow apartment={apartment} current_user = {this.props.current_user} deleteApartment = {this.deleteApartment} />}} />

                <Route path="/apartmentnew" render={() => {
                  return  <ApartmentNew createApartment = {this.createApartment} current_user = {this.props.current_user} />
                }} />  

        </Switch>
      </Router>
    );
  }
}

export default App
