import "dart:html";
import "package:polymer/polymer.dart";
import 'package:logging/logging.dart' as logging;
import 'dart:js' as js;

@CustomTag("topic-crud")
class TopicCRUD extends PolymerElement {

  logging.Logger _logger = new logging.Logger("toipc_CURD");

  /*
   * To view the schema of this document refer to the file "Sample Topic JSON.js" in this project 
   */
  @observable
  Map topic = toObservable({ "name" : "", "tags" : [], "description" : "", "content" : "", "comments" : [], "questions" : "" });
  
  @observable
  List get topicCategories => [ "SE", "EE" ];

  //Default Constructor
  TopicCRUD.created() : super.created() {
    _logger.onRecord.listen((logging.LogRecord record) => print('${record.level.name}: ${record.time}: ${record.message}'));//Attaching a handler to display the log info to the console
    _logger.info("'topic-CRUD' instance created");
  }

  @override
  void attached() {
    super.attached();
    _logger.info("'topic-CRUD' instance attached to DOM");

    //CKEDITOR.replace( 'editor1' );
    js.context['CKEDITOR'].callMethod('replace', [$['topic-content']]);
  }

  //---General Function Definitions Starts
  
  //---General Function Definitions Ends

  //---Event handlers Starts
  void submitTopicEH(Event e, var detail, Node target){
    e.preventDefault();
    //Get the topic content editor JSON object (JsObject)
    js.JsObject topicContentEditorJsObject = js.context["CKEDITOR"]["instances"]["topic-content"];
    topic['content'] = topicContentEditorJsObject.callMethod("getData", []);//Extracting the CKEditor html fragment
    SelectElement categorySelect = $['topic-category'];
    //Making a request to server and posting the topic document
    _logger.info(topic.toString());
    HttpRequest.postFormData("/java-training-app/topicCRUD", { "action" : "submit_topic", "category" : categorySelect.value, "topicDocument" : topic.toString() });
  }
  void addTopicTagEH(Event e, var detail, Node target){
    topic['tags'].add(target.value.toLowerCase());//Tag is always lower cased
    target.value = "";
    _logger.info(topic['tags'].toString());
  }
  void addTopicDescriptionEH(Event e, var detail, Node target){
      topic['description'] = target.value;
      _logger.info(topic['description']);
  }
  //---Event handlers Ends
}