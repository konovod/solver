@[Link("Sym")]
lib LibSymphony
  enum Status
    NO_PROBLEM                  = 225
    NO_SOLUTION                 = 226
    OPTIMAL_SOLUTION_FOUND      = 227
    TIME_LIMIT_EXCEEDED         = 228
    NODE_LIMIT_EXCEEDED         = 229
    ITERATION_LIMIT_EXCEEDED    = 230
    TARGET_GAP_ACHIEVED         = 231
    FOUND_FIRST_FEASIBLE        = 232
    FINISHED                    = 233
    UNFINISHED                  = 234
    FEASIBLE_SOLUTION_FOUND     = 235
    SIGNAL_CAUGHT               = 236
    UNBOUNDED                   = 237
    PREP_OPTIMAL_SOLUTION_FOUND = 238
    PREP_NO_SOLUTION            = 239

    ERROR_NO_BRANCHING_CANDIDATE = -250
    ERROR_ILLEGAL_RETURN_CODE    = -251
    ERROR_NUMERICAL_INSTABILITY  = -252
    ERROR_COMM_ERROR             = -253
    ERROR_USER                   = -275
    PREP_ERROR                   = -276
  end

  fun version = sym_version
  fun open_environment = sym_open_environment : Environment
  type Environment = Void*
  fun close_environment = sym_close_environment(env : Environment) : LibC::Int
  fun reset_environment = sym_reset_environment(env : Environment) : LibC::Int
  fun set_defaults = sym_set_defaults(env : Environment) : LibC::Int
  fun parse_command_line = sym_parse_command_line(env : Environment, argc : LibC::Int, argv : LibC::Char**) : LibC::Int
  fun set_user_data = sym_set_user_data(env : Environment, user : Void*) : LibC::Int
  fun get_user_data = sym_get_user_data(env : Environment, user : Void**) : LibC::Int
  fun read_mps = sym_read_mps(env : Environment, infile : LibC::Char*) : LibC::Int
  fun read_lp = sym_read_lp(env : Environment, infile : LibC::Char*) : LibC::Int
  fun read_gmpl = sym_read_gmpl(env : Environment, modelfile : LibC::Char*, datafile : LibC::Char*) : LibC::Int
  fun write_mps = sym_write_mps(env : Environment, infile : LibC::Char*) : LibC::Int
  fun write_lp = sym_write_lp(env : Environment, infile : LibC::Char*) : LibC::Int
  fun load_problem = sym_load_problem(env : Environment) : LibC::Int
  fun find_initial_bounds = sym_find_initial_bounds(env : Environment) : LibC::Int
  fun solve = sym_solve(env : Environment) : Status
  fun warm_solve = sym_warm_solve(env : Environment) : Status
  fun mc_solve = sym_mc_solve(env : Environment) : Status
  fun create_permanent_cut_pools = sym_create_permanent_cut_pools(env : Environment, cp_num : LibC::Int*) : LibC::Int
  fun explicit_load_problem = sym_explicit_load_problem(env : Environment, numcols : LibC::Int, numrows : LibC::Int, start : LibC::Int*, index : LibC::Int*, value : LibC::Double*, collb : LibC::Double*, colub : LibC::Double*, is_int : LibC::Char*, obj : LibC::Double*, obj2 : LibC::Double*, rowsen : LibC::Char*, rowrhs : LibC::Double*, rowrng : LibC::Double*, make_copy : LibC::Char) : LibC::Int
  fun is_abandoned = sym_is_abandoned(env : Environment) : LibC::Int
  fun is_proven_optimal = sym_is_proven_optimal(env : Environment) : LibC::Int
  fun is_proven_primal_infeasible = sym_is_proven_primal_infeasible(env : Environment) : LibC::Int
  fun is_iteration_limit_reached = sym_is_iteration_limit_reached(env : Environment) : LibC::Int
  fun is_time_limit_reached = sym_is_time_limit_reached(env : Environment) : LibC::Int
  fun is_target_gap_achieved = sym_is_target_gap_achieved(env : Environment) : LibC::Int
  fun get_status = sym_get_status(env : Environment) : Status
  fun get_num_cols = sym_get_num_cols(env : Environment, numcols : LibC::Int*) : LibC::Int
  fun get_num_rows = sym_get_num_rows(env : Environment, numrows : LibC::Int*) : LibC::Int
  fun get_num_elements = sym_get_num_elements(env : Environment, numelems : LibC::Int*) : LibC::Int
  fun get_col_lower = sym_get_col_lower(env : Environment, collb : LibC::Double*) : LibC::Int
  fun get_col_upper = sym_get_col_upper(env : Environment, colub : LibC::Double*) : LibC::Int
  fun get_row_sense = sym_get_row_sense(env : Environment, rowsen : LibC::Char*) : LibC::Int
  fun get_rhs = sym_get_rhs(env : Environment, rowrhs : LibC::Double*) : LibC::Int
  fun get_matrix = sym_get_matrix(env : Environment, nz : LibC::Int*, matbeg : LibC::Int*, matind : LibC::Int*, matval : LibC::Double*) : LibC::Int
  fun get_row_range = sym_get_row_range(env : Environment, rowrng : LibC::Double*) : LibC::Int
  fun get_row_lower = sym_get_row_lower(env : Environment, rowlb : LibC::Double*) : LibC::Int
  fun get_row_upper = sym_get_row_upper(env : Environment, rowub : LibC::Double*) : LibC::Int
  fun get_obj_coeff = sym_get_obj_coeff(env : Environment, obj : LibC::Double*) : LibC::Int
  fun get_obj2_coeff = sym_get_obj2_coeff(env : Environment, obj2 : LibC::Double*) : LibC::Int
  fun get_obj_sense = sym_get_obj_sense(env : Environment, sense : LibC::Int*) : LibC::Int
  fun is_continuous = sym_is_continuous(env : Environment, index : LibC::Int, value : LibC::Int*) : LibC::Int
  fun is_binary = sym_is_binary(env : Environment, index : LibC::Int, value : LibC::Int*) : LibC::Int
  fun is_integer = sym_is_integer(env : Environment, index : LibC::Int, value : LibC::Char*) : LibC::Int
  fun get_infinity = sym_get_infinity : LibC::Double
  fun get_col_solution = sym_get_col_solution(env : Environment, colsol : LibC::Double*) : LibC::Int
  fun get_sp_size = sym_get_sp_size(env : Environment, size : LibC::Int*) : LibC::Int
  fun get_sp_solution = sym_get_sp_solution(env : Environment, index : LibC::Int, colsol : LibC::Double*, objval : LibC::Double*) : LibC::Int
  fun get_row_activity = sym_get_row_activity(env : Environment, rowact : LibC::Double*) : LibC::Int
  fun get_obj_val = sym_get_obj_val(env : Environment, objval : LibC::Double*) : LibC::Int
  fun get_primal_bound = sym_get_primal_bound(env : Environment, ub : LibC::Double*) : LibC::Int
  fun get_iteration_count = sym_get_iteration_count(env : Environment, numnodes : LibC::Int*) : LibC::Int
  fun set_obj_coeff = sym_set_obj_coeff(env : Environment, index : LibC::Int, value : LibC::Double) : LibC::Int
  fun set_obj2_coeff = sym_set_obj2_coeff(env : Environment, index : LibC::Int, value : LibC::Double) : LibC::Int
  fun set_col_lower = sym_set_col_lower(env : Environment, index : LibC::Int, value : LibC::Double) : LibC::Int
  fun set_col_upper = sym_set_col_upper(env : Environment, index : LibC::Int, value : LibC::Double) : LibC::Int
  fun set_row_lower = sym_set_row_lower(env : Environment, index : LibC::Int, value : LibC::Double) : LibC::Int
  fun set_row_upper = sym_set_row_upper(env : Environment, index : LibC::Int, value : LibC::Double) : LibC::Int
  fun set_row_type = sym_set_row_type(env : Environment, index : LibC::Int, rowsense : LibC::Char, rowrhs : LibC::Double, rowrng : LibC::Double) : LibC::Int
  fun set_obj_sense = sym_set_obj_sense(env : Environment, sense : LibC::Int) : LibC::Int
  fun set_col_solution = sym_set_col_solution(env : Environment, colsol : LibC::Double*) : LibC::Int
  fun set_primal_bound = sym_set_primal_bound(env : Environment, bound : LibC::Double) : LibC::Int
  fun set_continuous = sym_set_continuous(env : Environment, index : LibC::Int) : LibC::Int
  fun set_integer = sym_set_integer(env : Environment, index : LibC::Int) : LibC::Int
  fun set_col_names = sym_set_col_names(env : Environment, colname : LibC::Char**) : LibC::Int
  fun add_col = sym_add_col(env : Environment, numelems : LibC::Int, indices : LibC::Int*, elements : LibC::Double*, collb : LibC::Double, colub : LibC::Double, obj : LibC::Double, is_int : LibC::Char, name : LibC::Char*) : LibC::Int
  fun add_row = sym_add_row(env : Environment, numelems : LibC::Int, indices : LibC::Int*, elements : LibC::Double*, rowsen : LibC::Char, rowrhs : LibC::Double, rowrng : LibC::Double) : LibC::Int
  fun delete_cols = sym_delete_cols(env : Environment, num : LibC::Int, indices : LibC::Int*) : LibC::Int
  fun delete_rows = sym_delete_rows(env : Environment, num : LibC::Int, indices : LibC::Int*) : LibC::Int
  fun write_warm_start_desc = sym_write_warm_start_desc(ws : WarmStartDesc, file : LibC::Char*) : LibC::Int
  type WarmStartDesc = Void*
  fun read_warm_start = sym_read_warm_start(file : LibC::Char*) : WarmStartDesc
  fun delete_warm_start = sym_delete_warm_start(ws : WarmStartDesc)
  fun get_warm_start = sym_get_warm_start(env : Environment, copy_warm_start : LibC::Int) : WarmStartDesc
  fun set_warm_start = sym_set_warm_start(env : Environment, ws : WarmStartDesc) : LibC::Int
  fun set_int_param = sym_set_int_param(env : Environment, key : LibC::Char*, value : LibC::Int) : LibC::Int
  fun set_dbl_param = sym_set_dbl_param(env : Environment, key : LibC::Char*, value : LibC::Double) : LibC::Int
  fun set_str_param = sym_set_str_param(env : Environment, key : LibC::Char*, value : LibC::Char*) : LibC::Int
  fun get_int_param = sym_get_int_param(env : Environment, key : LibC::Char*, value : LibC::Int*) : LibC::Int
  fun get_dbl_param = sym_get_dbl_param(env : Environment, key : LibC::Char*, value : LibC::Double*) : LibC::Int
  fun get_str_param = sym_get_str_param(env : Environment, key : LibC::Char*, value : LibC::Char**) : LibC::Int
  fun get_lb_for_new_rhs = sym_get_lb_for_new_rhs(env : Environment, cnt : LibC::Int, new_rhs_ind : LibC::Int*, new_rhs_val : LibC::Double*, lb_for_new_rhs : LibC::Double*) : LibC::Int
  fun get_ub_for_new_rhs = sym_get_ub_for_new_rhs(env : Environment, cnt : LibC::Int, new_rhs_ind : LibC::Int*, new_rhs_val : LibC::Double*, ub_for_new_rhs : LibC::Double*) : LibC::Int
  fun get_ub_for_new_obj = sym_get_ub_for_new_obj(env : Environment, cnt : LibC::Int, new_obj_ind : LibC::Int*, new_obj_val : LibC::Double*, ub_for_new_obj : LibC::Double*) : LibC::Int
  fun create_copy_warm_start = sym_create_copy_warm_start(ws : WarmStartDesc) : WarmStartDesc
  fun create_copy_mip_desc = sym_create_copy_mip_desc(env : Environment) : MiPdesc
  type MiPdesc = Void*
  fun get_presolved_mip_desc = sym_get_presolved_mip_desc(env : Environment) : MiPdesc
  fun create_copy_environment = sym_create_copy_environment(env : Environment) : Environment
  fun test = sym_test(env : Environment, argc : LibC::Int, argv : LibC::Char**, test_status : LibC::Int*) : LibC::Int
end
