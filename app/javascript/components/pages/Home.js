import React, { Component } from 'react'
import {Button, Card, CardImg, Col} from 'reactstrap'

class Home extends Component {
  render() {
    const {
        logged_in,
        current_user,
    } = this.props
    return (
        <>  
            <div className='home_container'>
             <h1>Home Sweet Home</h1>
             <h5>Find Your Dream Home Today</h5>   
            </div>  

            {!logged_in &&
                <>
                    <div>
                     <article>
                        <img src='https://images.unsplash.com/photo-1484154218962-a197022b5858?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80' />
                        <h3>Lorem Ipsum</h3>
                     </article>
                     <article>
                        <img src='https://images.unsplash.com/photo-1484154218962-a197022b5858?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80' />
                        <h3>Lorem Ipsum</h3>
                     </article>
                     <article>
                        <img src='https://images.unsplash.com/photo-1484154218962-a197022b5858?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80' />
                        <h3>Lorem Ipsum</h3>
                     </article>
                   </div>
                </>
            }
        </>
    )
  }
}

export default Home