import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import Header from './Header'

class App extends Component {
    render () {
        return (
            <BrowserRouter>
                <div>
                    <Header />
                    <BlockOne/>
                    <BlockTwo/>
                </div>
            </BrowserRouter>
        )
    }
}


class MyCall extends React.Component {
    componentDidMount() {
        fetch(this.state.endPoint)
            .then(res => res.json())
            .then(
                (result) => {
                    this.setState({
                        isLoaded: true,
                        data: result.items
                    });
                },
                // Note: it's important to handle errors here
                // instead of a catch() block so that we don't swallow
                // exceptions from actual bugs in components.
                (error) => {
                    this.setState({
                        isLoaded: true,
                        error
                    });
                }
            )
    }

}

/*
* вывести в 1 блок:
* заголовки и ид продуктов которые входят более чем в одну категорию
* */
class BlockOne extends MyCall {
    constructor(props) {
        super(props);
        this.state = {
            // endPoint: "http://www.mocky.io/v2/5c8b79173600004d0b8f80f3",
            endPoint: "/api/productsone",
            error: null,
            isLoaded: false,
            data: []
        };
    }

    render() {
        const { error, isLoaded, data } = this.state;
        if (error) {
            return <div>Error: {error.message}</div>;
        } else if (!isLoaded) {
            return <div>Loading...</div>;
        } else {
            return (
                <div>
                    <h2>BlockOne</h2>
                    <table>
                        <tbody>
                        <tr>
                            <th>id</th>
                            <th>title</th>
                            <th>price</th>
                        </tr>
                        {this.state.data.map((person, i) => <TableRowBlockOne key = {i}
                                                                              data = {person} />)}
                        </tbody>
                    </table>
                </div>
            );
        }
    }
}

/*
* вывести в 2 блок
* заголовки 3х пар самых дорогих продуктов
* */
class BlockTwo extends MyCall {
    constructor(props) {
        super(props);
        this.state = {
            endPoint: "/api/productstwo",
            error: null,
            isLoaded: false,
            data: []
        };
    }

    render() {
        return (
            <div>
                <h2>BlockTwo</h2>
                <table>
                    <tbody>
                    <tr>
                        <th>title</th>
                        <th>price</th>
                    </tr>
                    {this.state.data.map((person, i) => <TableRowBlockTwo key = {i}
                                                                          data = {person} />)}
                    </tbody>
                </table>
            </div>
        );
    }
}

class TableRowBlockOne extends React.Component {
    render() {
        return (
            <tr>
                <td>{this.props.data.id}</td>
                <td>{this.props.data.name}</td>
                <td>{this.props.data.price}</td>
            </tr>
        );
    }
}


class TableRowBlockTwo extends React.Component {
    render() {
        return (
            <tr>
                <td>{this.props.data.fulltitle}</td>
                <td>{this.props.data.thesum}</td>
            </tr>
        );
    }
}

ReactDOM.render(<App />, document.getElementById('app'))