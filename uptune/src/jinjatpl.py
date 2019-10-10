import sys, os
from jinja2 import Environment, FileSystemLoader


class JinjaParser(object):
    """
    Jinja parser for generated tpl called by 
    top-level controller for generating ray.run()
    """
    def init(self):
        """
        setup loader and template syntax
        """
        self.loader = FileSystemLoader(searchpath=os.getcwd()) 
        self.env = Environment(
            loader = self.loader,
            block_start_string = "{#",
            block_end_string = "#}",
            line_statement_prefix="#%", 
            variable_start_string="${{", 
            variable_end_string="}}")
        self.env.filters['patch'] = patch
        self.context = {'node': -1, 
                        'cfg': dict()} 

    def render(self, filename):
        """
        load file and return rendered output
        """
        template = self.env.get_template(filename)
        return template.render(self.context) 

    def set_context(self, cfg, node):
        """
        setup context with opentuner proposal for rendering
        """
        self.context['node'] = node
        self.context['cfg']  = cfg

    def codegen(self, node, dr, filename):
        """
        dump code from tpl to file(s) based on dr  
        """
        self.init()
        self.set_context(dr.configuration.data, node)
        result = self.render('template.tpl')
        with open(filename, 'w') as fp:
            fp.writelines(result)
        fp.close()


def patch(string):
    """
    patch for boolean variable from tojson 
    """
    if string == "false": return "False"
    if string == "true": return "True"
    return string


if __name__ == "__main__":
    # local tpl file loaded directly from FS. Example of file content:
    # a = ${{ cfg['xxx'] }} # {% a=TuneInt(1, (2, 8), 'xxx') %}
    parser = JinjaParser()
    result = parser.render('template.tpl')
    with open('template.tpl', 'w') as fp:
        fp.writelines(result)
    fp.close()


