# Chapter 04: Replacing the algorithm with the strategy

Pull the algorithm out into a separete object.

By using the Strategy pattern, we relieve the Report class of any responsibility for knowledge of the report file format.

Because the Strategy pattern is based on composition and delegation, rather than on inheritance, it is easy to switch strategies at runtime. 

```
report = Report.new(HTMLFormatter.new)
report.output_report

report.formatter = PlainTextFormatter.new
report.output_report
```

## Passing the context

```
class Report
  # [...]
  def output_report
    @formatter.output_report(self)
  end
end

class Formatter
  def output_report(context)
    raise 'Abstract method called'
  end
end
```

Then in `Formatter` classes we can use `context.title` and `context.text`.

Although this technique of passing the context to the strategy does simplify the flow of data, it also increases the coupling between the context and the strategy. This magnifies the danger that the context class and the strategy classes will get tangled up with each other.

## Duck typing

No need for `Formatter` base class. It is very un-Ruby implementation. Remove it.

## Proc

In Ruby, a `Proc` is an object that holds a chunk of code. The most common way to make a `Proc` is with the `lambda` method.
