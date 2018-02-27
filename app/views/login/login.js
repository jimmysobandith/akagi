var dialogsModule = require("ui/dialogs");
var observableModule = require("data/observable")
var ObservableArray = require("data/observable-array").ObservableArray;
var searchBarModule = require("tns-core-modules/ui/search-bar");
var searchBar = new searchBarModule.SearchBar();
var page;

var GroceryListViewModel = require("../../shared/view-models/grocery-list-view-model");

var groceryList = new GroceryListViewModel([]);
var pageData = new observableModule.fromObject({
    groceryList: groceryList
});

exports.loaded = function(args) {
    page = args.object;
    page.bindingContext = pageData;

    groceryList.empty();
    groceryList.load();
};

exports.buttonTap = function(args) {
    page = args.object;
    page.bindingContext = pageData;

    groceryList.empty();
    groceryList.load();
    alert("Liste Raffraichis");
};