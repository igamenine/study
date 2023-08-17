template <class T>
class TAnyTemp{
    T x, y;
  public:
    TanyTemp(T X, T Y):x(X), y(Y){}
    T getx(){
      return x;
    }
    T gety(){
      return y;
    }
};