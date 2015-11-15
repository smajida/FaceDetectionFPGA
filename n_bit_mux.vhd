--#  where b is the base
function ceil_log(n, b : positive) return natural is
  variable log, residual : natural;
begin

  residual := n - 1;
  log := 0;

  while residual > 0 loop
    residual := residual / b;
    log := log + 1;
  end loop;

  return log;
end function;


function mux_data(Inputs : data; Sel : unsigned)
  return std_ulogic_vector is

  alias inputs_asc    : data(0 to Inputs'length-1) is Inputs;
  variable pad_inputs : data(0 to (2 ** Sel'length) - 1);
  variable result     : std_ulogic_vector(inputs_asc(0)'range);
begin

  assert inputs_asc'length <= 2 ** Sel'length
    report "Inputs vector size: " & integer'image(Inputs'length)
      & " is too big for the selection vector"
    severity failure;

  pad_inputs := (others => (others => '0'));
  pad_inputs(inputs_asc'range) := inputs_asc;
  result := pad_inputs(to_integer(Sel));

  return result;
end function;


signal mux_in  : data(0 to entries-1);
signal mux_out : std_ulogic_vector(data_width-1 downto 0);
signal mux_sel : unsigned(ceil_log(entries, 2)-1 downto 0);
...

mux_out <= mux_data(mux_in, mux_sel);