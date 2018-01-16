var config = require("../../shared/config");
var fetchModule = require("fetch");
var ObservableArray = require("data/observable-array").ObservableArray;

var evenement = [
                    {id: 0, titre: "Rassemblement des mins", lieu: "Nantes - 44000", date: "Lundi 01 Janvier 2018"}, 
                    {id: 1, titre: "Rassemblement des mins", lieu: "Nantes - 44000", date: "Lundi 01 Janvier 2018"}, 
                    {id: 2, titre: "Rassemblement des mins", lieu: "Nantes - 44000", date: "Lundi 01 Janvier 2018"}, 
                    {id: 3, titre: "Rassemblement des mins", lieu: "Nantes - 44000", date: "Lundi 01 Janvier 2018"}, 
                    {id: 4, titre: "Rassemblement des mins", lieu: "Nantes - 44000", date: "Lundi 01 Janvier 2018"}, 
                    {id: 5, titre: "Rassemblement des mins", lieu: "Nantes - 44000", date: "Lundi 01 Janvier 2018"}, 
                    {id: 6, titre: "Rassemblement des mins", lieu: "Nantes - 44000", date: "Lundi 01 Janvier 2018"}, 
                    {id: 7, titre: "Rassemblement des mins", lieu: "Nantes - 44000", date: "Lundi 01 Janvier 2018"}, 
                    {id: 8, titre: "Rassemblement des mins", lieu: "Nantes - 44000", date: "Lundi 01 Janvier 2018"}, 
                    {id: 9, titre: "Rassemblement des mins", lieu: "Nantes - 44000", date: "Lundi 01 Janvier 2018"}, 
                    {id: 10, titre: "Rassemblement des mins", lieu: "Nantes - 44000", date: "Lundi 01 Janvier 2018"}, 
                    {id: 11, titre: "Rassemblement des mins", lieu: "Nantes - 44000", date: "Lundi 01 Janvier 2018"}, 
                ];

function GroceryListViewModel(items) {
    var viewModel = new ObservableArray(items);

    viewModel.load = function() {
       viewModel.push(evenement);
    };
    
    viewModel.empty = function() {
        while (viewModel.length) {
            viewModel.pop();
        }
    };


    return viewModel;
}

function handleErrors(response) {
    if (!response.ok) {
        console.log(JSON.stringify(response));
        throw Error(response.statusText);
    }
    return response;
}

module.exports = GroceryListViewModel;