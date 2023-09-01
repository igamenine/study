class Shape{
  public:
    virtual void draw() const = 0;
    virtual void error(const char * msg);
    int objectID() const;
    ...
};
