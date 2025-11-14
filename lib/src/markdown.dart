// Stvff doesn't like these...
// ignore_for_file: constant_identifier_names, non_constant_identifier_names, camel_case_extensions, prefer_final_locals, curly_braces_in_flow_control_structures, avoid_multiple_declarations_per_line

import "package:techs_html_bindings/elements.dart";

/// Parse markdown
List<Element> markdown(String markdown) {
  List<int> runes = markdown.runes.toList();
  List<Element> final_list = [];
  (final_list, _) = parse_md(runes, 0, return_on_newline: false);
  return final_list;
}

enum Alignment {
  Default,
  Left,
  Middle,
  Right,
}

const Newline = 10,
    Space = 32,
    Bang = 33,
    Hash = 35,
    Paren_Open = 40,
    Paren_Close = 41,
    Star = 42,
    Dash = 45,
    Colon = 58,
    HTML_Open = 60,
    HTML_Close = 62,
    Bracket_Open = 91,
    Bracket_Close = 93,
    Underscore = 95,
    Pipe = 124;

(List<Element> elements, int new_i) parse_md(List<int> runes, int i_in, {required bool return_on_newline}) {
  List<Element> elements = [];
  int i = i_in;

  List<Element> paragraph_content = [];
  StringBuffer line = StringBuffer();

  outer_loop:
  for (; i < runes.length; i += 1) {
    int rune = runes[i];
    switch (rune) {
      case Newline:
        /* check for headers */
        int level = 0;
        i += 1;
        for (; runes.at(i, Hash); i += 1) level += 1;
        if (level > 0 && runes.at(i, Space)) {
          i += 1;
          List<Element> header_content = [];
          (header_content, i) = parse_md(runes, i, return_on_newline: true);
          elements.add(Hn.fromLevel(level: level, children: header_content));
        } else
          i -= 1;

        if (level == 0 && line.length > 0) {
          if (runes.at(i-1, Space) && runes.at(i-2, Space)) {
            line.write("<br/>");
          }
          add(line, Space);
          add_as_T(paragraph_content, line);
          if (return_on_newline) return (paragraph_content, i);
        }

        if (runes.at(i + 1, Newline) && paragraph_content.isNotEmpty) {
          elements.add(P(children: paragraph_content));
          paragraph_content = [];
        }

      case HTML_Open:
        /* zips through html */
        for (; runes.nat(i, HTML_Close); i += 1) add(line, runes[i]);
        if (i < runes.length) add(line, runes[i]);

        add_as_T(elements, line);
      case Bang:
        /* check for picture */
        i += 1;
        if (runes.at(i, Bracket_Open)) {
          add_as_T(paragraph_content, line);
          String href;
          Element content;
          (href, content, i) = parse_link(runes, i);
          paragraph_content.add(Image(src: href, alt: (content as T).text));
        } else {
          add(line, rune);
        }
      case Bracket_Open:
        /* href */
        add_as_T(paragraph_content, line);
        String href;
        Element content;
        (href, content, i) = parse_link(runes, i);
        paragraph_content.add(A(href: href, children: [content]));
      case Star:
        /* italics or strong */
        if (i + 1 < runes.length && runes[i + 1] == Star) {
          i += 2;
          add_as_T(paragraph_content, line);
          for (; runes.nat(i, Star); i += 1) add(line, runes[i]);
          if (runes.at(i + 1, Star)) {
            paragraph_content.add(Strong(children: [T(line.toString())]));
            line.clear();
            i += 1;
          } else {
            paragraph_content.add(Em(children: [T(line.toString())]));
            line.clear();
          }
          break;
        }
        continue Underscore_Case;
      Underscore_Case:
      case Underscore:
        /* italics */
        if (runes[i - 1] != Space) {
          add(line, runes[i]);
          break;
        }
        int italic_start = runes[i];
        i += 1;
        add_as_T(paragraph_content, line);
        for (; runes.nat(i, italic_start); i += 1) add(line, runes[i]);
        paragraph_content.add(Em(children: [T(line.toString())]));
        line.clear();
      case Pipe:
        /* table....... */
        // if (line.length > 0 || paragraph_content.length > 0) {
        // 	/*(previous state)*/
        // 	add_as_T(paragraph_content, line);
        // 	elements.add(P(children: paragraph_content));
        // 	paragraph_content = [];
        // }
        /* top row */
        i += 1;
        List<String> top_row = [];
        bool break_row = false;
        while (!break_row) {
          for (; runes.nat(i, Pipe); i += 1) {
            if (runes.at(i, Newline)) {
              break_row = true;
              break;
            }
            add(line, runes[i]);
          }
          if (!break_row) {
            top_row.add(line.toString());
            line.clear();
            i += 1;
          }
        }
        // print("${top_row}");

        /* check for divider row (and parse the colons and whatnot) */
        i += 1;
        if (runes.nat(i, Pipe)) continue outer_loop;
        i += 1;

        List<Alignment> column_alignments = [];
        bool begin_colon = false;
        bool end_colon = false;

        break_row = false;
        while (!break_row) {
          int begin = i;
          for (; runes.nat(i, Pipe); i += 1) {
            int c = runes[i];
            if (c == Colon && i == begin)
              begin_colon = true;
            else if (c == Colon)
              end_colon = true;
            if (c == Newline) {
              break_row = true;
              break;
            }
          }
          if (!break_row) {
            Alignment ali = Alignment.Default;
            if (begin_colon) ali = Alignment.Left;
            if (end_colon) ali = Alignment.Right;
            if (begin_colon && end_colon) ali = Alignment.Middle;
            column_alignments.add(ali);
            i += 1;
            begin_colon = false;
            end_colon = false;
          }
        }

        List<TableHeader> headers = [];
        for (int ii = 0; ii < column_alignments.length; ii += 1) {
          String style_string = "";
          switch (column_alignments[ii]) {
            case Alignment.Default:
            case Alignment.Left:
              style_string = "text-align: left";
            case Alignment.Middle:
              style_string = "text-align: center";
            case Alignment.Right:
              style_string = "text-align: right";
          }
          headers.add(TableHeader(children: [T(top_row[ii])], inlineStyles: [style_string]));
        }
        // print("${headers}");
        elements.add(
          Table(
            head: TableHead(rows: [TableRow(cells: headers)]),
            body: TableBody(rows: []),
          ),
        );
      // print("${column_alignments}");
      /* check for following rows */
      default:
        add(line, rune);
    }
  }
  elements.add(P(children: paragraph_content));
  return (elements, i);
}

(String href, Element content, int new_i) parse_link(List<int> runes, int i_in) {
  StringBuffer line = StringBuffer();
  int i = i_in + 1;
  Element content;
  if (runes.at(i, Bang)) {
    i += 1;
    String href_to_link;
    Element alt_text_element;
    (href_to_link, alt_text_element, i) = parse_link(runes, i);
    content = Image(src: href_to_link, alt: (alt_text_element as T).text);
  } else {
    for (; runes.nat(i, Bracket_Close); i += 1) add(line, runes[i]);
    content = T(line.toString());
  }
  line.clear();
  i += 2;
  for (; runes.nat(i, Paren_Close); i += 1) add(line, runes[i]);
  String href = line.toString();
  return (href, content, i);
}

extension Literally_Anything on List<int> {
  bool at<V>(int index, V value) {
    return index < length && this[index] == value;
  }

  bool nat<V>(int index, V value) {
    return index < length && this[index] != value;
  }
}

void add(StringBuffer buff, int rune) {
  buff.write(String.fromCharCode(rune));
}

void add_as_T(List<Element> list, StringBuffer text) {
  list.add(T(text.toString()));
  text.clear();
}
