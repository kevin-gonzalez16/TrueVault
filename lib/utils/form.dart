class Form{

  //class variables
  Map formDetails = {
    "serviceName" : "",
    "username" : "",
    "password" : "",
    "notes" : "",
    "url" : "",
    "icon" : ""
  };
  DateTime lastEdited = DateTime.now();

  //Constructor
  /*
    When calling constructor, it should look like:
    Form([serviceName,username,password,notes,url,icon])
    with the actual strings. The constructor traverses the list
    passed and maps it by location,so make sure the order is correct.
    Also the list must be <String> if its <dynamic> it will error.
  */
  Form(List<String>details){

    Iterable keys = formDetails.keys;
    int index = 0;
    for (var element in details) {
      formDetails[keys.elementAt(index)] = element;
      index += 1;
    }

    lastEdited = DateTime.now();
  }

  //Datetime to string
  String returnLastEdited(){
    String edited = lastEdited.month.toString()+"/"+lastEdited.day.toString();
    edited += "/"+lastEdited.year.toString();
    return edited;
  }

  //edit existing form and change the edited date
  /*
    To edit a form, pass the detail you want to change and
    the new string. For example:
    editForm("serviceName","Discord")
    Make sure the first parameter exactly matches one of
    the details in the map. Otherwise it will make a new entry.
  */
  void editForm(String detail, String newDetail){
    formDetails[detail] = newDetail;
    lastEdited = DateTime.now();

  }
}