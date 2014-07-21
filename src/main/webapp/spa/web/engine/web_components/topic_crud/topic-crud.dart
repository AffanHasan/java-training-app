import "dart:html";
import "package:polymer/polymer.dart";
import 'package:logging/logging.dart' as logging;
import 'dart:js' as js;

@CustomTag("topic-crud")
class TopicCRUD extends PolymerElement  {
  
  logging.Logger _logger = new logging.Logger("toipc_CURD");
  
  @observable
  Map topic = {};
  
//Default Constructor
  TopicCRUD.created() : super.created(){
    _logger.onRecord.listen((logging.LogRecord record)=>print('${record.level.name}: ${record.time}: ${record.message}'));//Attaching a handler to display the log info to the console
    _logger.info("'topic-CRUD' instance created");
  }
  
  @override
  void attached(){
    super.attached();
    _logger.info("'topic-CRUD' instance attached to DOM");
    
    //CKEDITOR.replace( 'editor1' );
   js.context['CKEDITOR'].callMethod('replace', [ $['topic-content'] ]);
  }
  
//---General Function Definitions Starts
  Map getAddTopicRequestData(){
    topic['topicName'] = $['topic-name'].text;
    topic['tags'] = $['topic-name'].text;
    return topic;
  }
//---General Function Definitions Ends
  
//---Event handlers Starts
  void submitTopicEH(Event e, var detail, Node target){
    e.preventDefault();
    /*
    _logger.info("Making a request");
    var request = new HttpRequest();
    request.onReadyStateChange.listen((response){
      
    });
    request.open('POST', '/java-training-app/topicCRUD');
    request.send();
    */
    HttpRequest.postFormData('/java-training-app/topicCRUD', getAddTopicRequestData());
  }
//---Event handlers Ends
}