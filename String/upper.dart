

void main(List<String> args) {
  
}
   String toUpperCase(String s) {
        if (s == null || s=="") {
            return s;
        }
        String values = s;
        for (int i = 0; i < values.length; ++i) {
            if (values[i].isLetter() && values[i]==values[i].toLowerCase()) {
                values[i] == values[i].toLowerCase();
            }
        }
        return values;
    }

    extension  IsLetter on String{
        bool isLetter(){
          if(this.toLowerCase().codeUnitAt(0)>64 && this.toLowerCase().codeUnitAt(0)<91)
          return true;
          else return false;
        }
        
        
    }