import React, { Component } from 'react'
import {Nav, Navbar, NavItem} from 'reactstrap'

class Header extends Component {
  render() {
    const {
        logged_in,
        new_user_route,
        sign_in_route,
        sign_out_route
      } = this.props

    return (
      <>
        <Navbar className={"header"}>
            <Nav>
              {/* Home page link for all users */}
              {
                <NavItem>
                  <a href='/' id='home' className="nav-link">Home</a>
                </NavItem>
              }


              {/* Apartment index(unprotected) link for all users */}
              {!logged_in &&
                <NavItem>
                  <a href='/apartmentindex' className="nav-link">Recent Listings</a>
                </NavItem>
              }

              {/* Apartment index(protected) link for logged in users */}
              {logged_in &&
              <NavItem>
                <a href='/apartmentindex' className="nav-link">All Listings</a>
              </NavItem>
              }

              {/* Sign in link for users not logged in */}
              {!logged_in &&
                <NavItem>
                  <a href={sign_in_route} className="nav-link">Sign In</a>
                </NavItem>
              }

              {/* Sign up link for not logged in users */}
              {!logged_in &&
                <NavItem className="last-item">
                  <a href={new_user_route} className="nav-link">Sign Up</a>
                </NavItem>
              }

              {/* My Apartment link for logged in user */}
              {logged_in &&
                <NavItem>
                  <a href='/myapartments' className="nav-link">My Apartments</a>
                </NavItem>
              }

              {/* New Apartment link for logged in user */}
              {logged_in &&
                <NavItem>
                  <a href='/apartmentnew' className="nav-link">Create Listing</a>
                </NavItem>
              }

              {/* Sign out link for logged in users */}
              {logged_in &&
                <NavItem className="last-item">
                  <a href={sign_out_route} className="nav-link">Sign Out</a>
                </NavItem>
              }
          </Nav>
        </Navbar>
      </>
    )
  }
}

export default Header