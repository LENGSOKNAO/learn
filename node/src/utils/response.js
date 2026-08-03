export const success = (res, data, message = "Success", status = 200) => {
  return res.status(status).json({ success: true, message, data });
};

export const created = (res, data, message = "Created successfully") => {
  return res.status(201).json({ success: true, message, data });
};

export const noContent = (res, message = "Deleted successfully") => {
  return res.status(200).json({ success: true, message });
};

export const paginated = (res, data, total, page, limit) => {
  return res.status(200).json({
    success: true,
    data,
    pagination: {
      total,
      page,
      limit,
      totalPages: Math.ceil(total / limit),
    },
  });
};