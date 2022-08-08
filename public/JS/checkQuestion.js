$(document).ready(function () {
    //   Mark all present button
    $('#mark-all-present').click(function () {
      $("input[type='checkbox']").each(function () {
        const s_id = $(this).attr('id');
        $(`input[name=${s_id}]`).val('True');
        $(this).prop('checked', true);
      });
    });
    //   Mark all absent button
    $('#mark-all-absent').click(function () {
      $("input[type='checkbox']").each(function () {
        const s_id = $(this).attr('id');
        $(`input[name=${s_id}]`).val('False');
        $(this).prop('checked', false);
      });
    });
  
    // onClick checkbox toggle
    $("input[type='checkbox']").click(function () {
      const s_id = $(this).attr('id');
      let isPresent = $(`input[name=${s_id}]`).val();
      if (isPresent == 'False') {
        isPresent = 'True';
      } else {
        isPresent = 'False';
      }
      $(`input[name=${s_id}]`).val(isPresent);
    });
  });
  