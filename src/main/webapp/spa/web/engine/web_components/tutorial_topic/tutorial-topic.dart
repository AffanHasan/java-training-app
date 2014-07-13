import "dart:html";
import "package:polymer/polymer.dart";

@CustomTag("tutorial-topic")
class TutorialTopic extends PolymerElement  {
  
  @observable
  var topic = {
               "_id"         : 123,

               "name"        : "JVM",

               "tags"        : [
                               "jvm",
                               "java virtual machine"
                              ],
                              
               "content"     : 
"""
<h1 class='topic-heading'>JVM</h1>
<hr>
<p>The <span class='bold'>JVM</span> <span class='bold italic'>Java Virtual Machine</span> is an <span class='highlight bold'>application software</span> which forms the platform for the JAVA related technology</p>
<p>The <span class='bold'>JVM</span> is <span class='bold'>responsible for</span> the <span class='highlight bold'><span class='bold'>hardware</span> & <span class='bold'>operating system</span> independence</span> of the <span class='bold'>JAVA<span> programming language</p>
<p>The <span class='bold'>JVM</span> is an <span class='highlight bold'>abstract computing machine</span> i.e it has it's own instruction set</p>
<h1 class='topic-heading'>Why Do I Need JVM...? WHY OOO WHY...?</h1>
<hr>
<p>Before the <span class='bold'>JAVA programming language</span> & <span class='bold'>JVM</span> there were other <span class='bold'>compiled</span> languages such as <span class='bold italic'>C, C++, Python...</span> etc</p>
<p><span class='bold italic'>C & C++</span> are not cross platform languages; <span class='bold'>MEANS...</span> The programmer needs to manually <span class='bold highlight'>AMMEND</span> the code for different <span class='highlight bold italic'>OPERATING SYSTEMS MY GOD WHAT A PAIN...:-(</span></p>
<p><span class='bold fs14'>JAVA ROCKS HERE ...!</span></p>
<h1 class='topic-heading'><span class='italic'>JVM</span> Knows Nothing About JAVA Programming Language, <span class='italic'>STRANGE...!</span></h1>
<hr>
<p>The <span class='bold'>JVM</span> knows about only one <span class='highlight bold'>instruction set</span>; we call it the <span class='bold italic highlight'>BYTE CODE !</span></p>
<p><span class='bold'>WOW...!</span></p>
<p><span class='bold'>SO</span> that means any <span class='bold italic'>PROGRAMMING LANGUAGE</span> which can be <span class='bold italic'>COMPILED TO</span> the <span class='bold italic'>BYTE CODE</span> can <span class='bold italic highlight'>RUN</span> on <span class='bold'>JVM</span>...?</p>
<img src='engine/images/JVM-Languages.png' />
<h1 class='topic-heading'>JVM Components</h1>
<hr>
"""
};
  
//Default Constructor
  TutorialTopic.created() : super.created(){
    print("tutorial-topic instance created");
    $['content'].innerHtml = topic['content'];
  }
  
  @override
  void attached(){
    super.attached();
    print("Attached");
  }
}